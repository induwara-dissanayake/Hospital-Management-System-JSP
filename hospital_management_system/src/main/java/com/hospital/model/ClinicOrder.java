package com.hospital.model;

public class ClinicOrder {
	
    int id;
    int patient_id;
    int clinic_id;
    
    
    public ClinicOrder(int patient_id, int clinic_id) {
		super();
		this.patient_id = patient_id;
		this.clinic_id = clinic_id;
	}
	
    
    
    
	public ClinicOrder(int id, int patient_id, int clinic_id) {
		super();
		this.id = id;
		this.patient_id = patient_id;
		this.clinic_id = clinic_id;
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
	public int getClinic_id() {
		return clinic_id;
	}
	public void setClinic_id(int clinic_id) {
		this.clinic_id = clinic_id;
	}
    


    
    
}
