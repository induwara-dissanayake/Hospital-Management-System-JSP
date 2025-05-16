package com.hospital.model;


public class OPDIlness{
	
	int order_id;
	String ilnessString;
	
	
	public OPDIlness() {

	}
	
	

	public OPDIlness(int order_id, String ilnessString) {
		super();
		this.order_id = order_id;
		this.ilnessString = ilnessString;
	}



	public int getOrder_id() {
		return order_id;
	}


	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	public String getIlnessString() {
		return ilnessString;
	}


	public void setIlnessString(String ilnessString) {
		this.ilnessString = ilnessString;
	}
	
	
	
}

