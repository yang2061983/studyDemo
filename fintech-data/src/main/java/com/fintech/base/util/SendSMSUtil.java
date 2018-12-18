package com.fintech.base.util;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.*;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.net.ssl.SSLContext;
import java.nio.charset.CodingErrorAction;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * 
 * @author Administrator
 *
 */
public class SendSMSUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(SendSMSUtil.class);

	/**根据不同的渠道，可能有不同的值*/
	private String esbUrl;

	public static String sendSms(String url ,Map<String,Object> msg) {
		String xml = buildESBRequest(msg);
		return doPost(url,xml);
	}
	
	private static final int REQUEST_TIMEOUT = 30 * 1000; // 设置请求超时10秒钟
    private static final int TIMEOUT         = 60 * 1000; // 连接超时时间
    private static final int SO_TIMEOUT      = 60 * 1000; // 数据传输超时
    private static final int MAX_TOTAL      = 200; // 最大链接数
    private static final int DEFAULT_MAX_PERROUTE = 50; // 默认路由最大链接数
    private static final String CHARSET      = "UTF-8";
    
	public static final String RESULT_SUCCESS = "0";//成功
	public static final String RESULT_FAIL = "1";//失败
	
	public static final String MOBILE ="phone";
	public static final String CONTENT ="content";
	
    
    private static PoolingHttpClientConnectionManager connManager = null;
    private static CloseableHttpClient httpClient = null;

	static {
		try {
			// SSLContext
			SSLContextBuilder sslContextbuilder = new SSLContextBuilder();
			sslContextbuilder.useTLS();
			SSLContext sslContext = sslContextbuilder.loadTrustMaterial(null,
					new TrustStrategy() {
						// 信任所有
				        @Override
						public boolean isTrusted(X509Certificate[] chain,
								String authType) throws CertificateException {
							return true;
						}
					}).build();

			Registry<ConnectionSocketFactory> socketFactoryRegistry = RegistryBuilder
					.<ConnectionSocketFactory> create()
					.register("http", PlainConnectionSocketFactory.INSTANCE)
					.register(
							"https",
							new SSLConnectionSocketFactory(
									sslContext,
									SSLConnectionSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER)).build();
			
			// Create ConnectionManager
			connManager = new PoolingHttpClientConnectionManager(
					socketFactoryRegistry);

			// Create socket configuration
			SocketConfig socketConfig = SocketConfig.custom()
					.setTcpNoDelay(true).build();
			connManager.setDefaultSocketConfig(socketConfig);

			// Create message constraints
			MessageConstraints messageConstraints = MessageConstraints.custom()
					.setMaxHeaderCount(200).setMaxLineLength(2000).build();

			// Create connection configuration
			ConnectionConfig connectionConfig = ConnectionConfig.custom()
					.setMalformedInputAction(CodingErrorAction.IGNORE)
					.setUnmappableInputAction(CodingErrorAction.IGNORE)
					.setCharset(Consts.UTF_8)
					.setMessageConstraints(messageConstraints).build();

			connManager.setDefaultConnectionConfig(connectionConfig);
			connManager.setMaxTotal(MAX_TOTAL);
			connManager.setDefaultMaxPerRoute(DEFAULT_MAX_PERROUTE);

			// Create httpClient
			httpClient = HttpClients.custom().disableRedirectHandling()
					.setConnectionManager(connManager).build();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    

	/**
	 * 构建请求esb的xml报文
	 * @param msg 消息队列中的MapMessage
	 * @return 请求esb的xml报文
	 * @throws JMSException
	 */
	private static String buildESBRequest(Map<String,Object> msg){
		StringBuilder sb = new StringBuilder("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		sb.append("<service>");
		sb.append(getHead());
		sb.append("<body>");
		sb.append("<phones>").append(msg.get(MOBILE)).append("</phones>");
		sb.append("<content><![CDATA["+msg.get(CONTENT)+"]]></content>");
		sb.append("<sendtime></sendtime>");
		sb.append("</body>");
		sb.append("</service>");

		logger.debug("发送报文：\n" + sb.toString());
		return sb.toString();
	}
	private static String getHead(){
		StringBuilder sb = new StringBuilder();
		sb.append("<esbhead>");
		sb.append("<commstat></commstat>");
		sb.append("<errorcode></errorcode>");
		sb.append("<errorinfo></errorinfo>");
		sb.append("</esbhead>");
		return sb.toString();
	}
	/**
	 * 向ESB提交POST请求
	 * @param requestXML 发送邮件的报文
	 * @return 0-成功、1-失败
	 */
	private static String doPost(String url,String requestXML) {
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Content-type", "text/xml; charset=utf-8");

		RequestConfig requestConfig = RequestConfig.custom()
				.setSocketTimeout(SO_TIMEOUT).setConnectTimeout(TIMEOUT)
				.setConnectionRequestTimeout(REQUEST_TIMEOUT)
				.setExpectContinueEnabled(false).build();

		httpPost.setConfig(requestConfig);// RequestConfig.DEFAULT

		String responseContent = null; // 响应内容
		try {
			httpPost.setEntity(new StringEntity(requestXML, CHARSET));
			// 执行post请求
			HttpResponse httpResponse = httpClient.execute(httpPost);
			// 获取HTTP响应的状态码
			int statusCode = httpResponse.getStatusLine().getStatusCode();
			HttpEntity entityRep = httpResponse.getEntity();
			if (statusCode == HttpStatus.SC_OK) {
				// 获取响应消息实体
				if (entityRep != null) {
					responseContent = EntityUtils.toString(entityRep, CHARSET);
				}
			} else {
				System.out.println(httpResponse);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			httpPost.releaseConnection();
		}
		
		logger.debug("返回结果：" + responseContent);
		if (responseContent != null && responseContent.indexOf("<commstat>0</commstat>") > 0) {
			return RESULT_SUCCESS;
		} else {
			return RESULT_FAIL;
		}
	}
	
	/**
	 * 随机生成6位随机验证码
	 * @return
	 */
    public static String createSMCode(int number){
        //验证码
        String vcode ="" ;
        Random r = new Random();
        for (int i = 0; i < number; i++) {
           // vcode = vcode + (int)(Math.random()*9);
        	 vcode = vcode + (int)(r.nextInt(9)+1);
        }
        return vcode;
    }
	
	
	public static void main(String[] args) throws Exception {
//		channel.esbUrl = "http://172.18.100.148:9010/esbbiz/smsServerSend";
//		String url = "http://172.19.100.233:9010/esbbiz/smsServerSend"; // TODO 生产环境，轻易勿用
//		String url = "http://172.18.100.148:9040/esbbiztoken/smsServerSend/cshx/v2";
	//	String url = "http://172.18.100.148:9040/esbbiztoken/smsServerSend/hl95/v2";
		//String url = "http://172.19.100.233:9040/esbbiztoken/smsServerSend/cshx/v2";
		String url ="http://172.18.100.168:9041/esbsms/api/sms/general/send";
		Map<String,Object> msg =new HashMap<String,Object>();
		String result = SendSMSUtil.createSMCode(4);
		msg.put(MOBILE, "13681433342");
		msg.put(CONTENT, "尊敬的用户，您的注册验证码：568523 【捷越财富】");
		String result1 = SendSMSUtil.sendSms(url,msg);
		System.out.println("result=" + result);
	    System.out.println(result1);
	}
}
