package com.hospital.model;

public class Prescription {
    private int id;
    private String prescription;
    private String type;
    
    public Prescription() {
		super();
	
	}
    
	public Prescription(int id, String prescription, String type) {
		super();
		this.id = id;
		this.prescription = prescription;
		this.type = type;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPrescription() {
		return prescription;
	}
	public void setPrescription(String prescription) {
		this.prescription = prescription;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}



    
    

}
