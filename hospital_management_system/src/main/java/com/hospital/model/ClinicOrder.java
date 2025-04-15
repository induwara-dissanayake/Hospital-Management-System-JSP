package com.hospital.model;

public class ClinicOrder {
	
    int id;
    int patient_id;
    
    public ClinicOrder() {
		super();
		
	}
    
    public ClinicOrder(int patient_id) {
		super();
		
		this.patient_id = patient_id;
	}
    
	public ClinicOrder(int id, int patient_id) {
		super();
		this.id = id;
		this.patient_id = patient_id;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
    
    
    
}
