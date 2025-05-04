package com.hospital.model;

public class Ilness{
	
	
	int order_id;
	int patient_id;
	int clinic_id;
	String illness;
	
	
	public Ilness() {
		
	}
	


	public Ilness(int order_id, int patient_id, int clinic_id, String illness) {
		super();
		this.order_id = order_id;
		this.patient_id = patient_id;
		this.clinic_id = clinic_id;
		this.illness = illness;
	}





	public int getOrder_id() {
		return order_id;
	}


	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	public int getPatient_id() {
		return patient_id;
	}


	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}


	public int getClinic_id() {
		return clinic_id;
	}


	public void setClinic_id(int clinic_id) {
		this.clinic_id = clinic_id;
	}


	public String getIllness() {
		return illness;
	}


	public void setIllness(String illness) {
		this.illness = illness;
	}
	
	
	
}