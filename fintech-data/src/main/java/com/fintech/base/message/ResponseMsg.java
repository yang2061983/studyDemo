package com.fintech.base.message;

import java.io.Serializable;

public class ResponseMsg<T> implements Serializable{
	private static final long serialVersionUID = 1L;
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private ResponseMsg<T>.Header header = new ResponseMsg.Header();
	private T responseBody;

	public T getResponseBody() {
		return this.responseBody;
	}

	public void setResponseBody(T responseBody) {
		this.responseBody = responseBody;
	}

	public String getRetCode() {
		return this.header.retCode;
	}

	public void setRetCode(String retCode) {
		this.header.retCode = retCode;
	}

	public String getErrorDesc() {
		return this.header.errorDesc;
	}

	public void setErrorDesc(String errorDesc) {
		this.header.errorDesc = errorDesc;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Header [retCode=");
		builder.append(this.getRetCode());
		builder.append(", errorDesc=");
		builder.append(this.getErrorDesc());
		builder.append("]");
		builder.append("   Body [");
		if (this.responseBody != null) {
			builder.append(this.responseBody.toString());
		}

		builder.append("]");
		return builder.toString();
	}

	private final class Header {
		String retCode;
		String errorDesc;

		private Header() {
			this.retCode = "200";
			this.errorDesc = null;
		}
	}
}
