package com.hospital.model;

public class ClinicPrescription {
    private int orderId;
    private int doctorId;
    private int patient_id;
    private int clinic_id;
    private int prescriptionId;
    private int routine;
    private int qty;
    private int days;
    
    
	public ClinicPrescription() {
		super();
	}


	public ClinicPrescription(int orderId, int doctorId, int patient_id, int clinic_id, int prescriptionId, int routine,
			int qty, int days) {
		super();
		this.orderId = orderId;
		this.doctorId = doctorId;
		this.patient_id = patient_id;
		this.clinic_id = clinic_id;
		this.prescriptionId = prescriptionId;
		this.routine = routine;
		this.qty = qty;
		this.days = days;
	}
	
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
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
	public int getPrescriptionId() {
		return prescriptionId;
	}
	public void setPrescriptionId(int prescriptionId) {
		this.prescriptionId = prescriptionId;
	}
	public int getRoutine() {
		return routine;
	}
	public void setRoutine(int routine) {
		this.routine = routine;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}

   


}
