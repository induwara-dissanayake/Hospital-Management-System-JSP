package com.hospital.model;

public class Prescription {
    private int id;
    private String prescription;

    public Prescription(int id, String prescription) {
        this.id = id;
        this.prescription = prescription;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getprescription() {
		return prescription;
	}

	public void setprescription(String prescription) {
		this.prescription = prescription;
	}

    
    

}
