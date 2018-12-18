package com.fintech.common.utils;

import java.io.Serializable;

public class EnumEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6244989469494944661L;
	/**
	 * 类型，例如com.xiangshang.constant.em.hq.HqBatchInfoStatus，必须带包名
	 */
	private String type;
	/**
	 * 枚举的一个实例，例如:DEAL_PROCESS
	 */
	private String value;
	/**
	 * 显示标签，例如:处理中
	 */
	private String label;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	@Override
	public String toString() {
		return "EnumEntity [type=" + type + ", value=" + value + ", label=" + label + "]";
	}
	
	
}
