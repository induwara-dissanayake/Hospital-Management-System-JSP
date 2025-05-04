package com.hospital.model;

import java.sql.Date;

public class PatientReport {
	
    int order_id;
    int doctor_id;
    int patient_id;
    int clinic_id;
    Date date;
    Date return_date;
    String weight;
    String sugar_level;
    String bp;
    String lipid_profile;
    String hemoglobin;
    String vision;
    String eye_pressure;
    String vdrl;
    String hiv;
    
    
    
    
	public PatientReport(int order_id, int doctor_id, int patient_id, int clinic_id, Date date, Date return_date, String weight,
			String sugar_level, String bp, String lipid_profile, String hemoglobin, String vision, String eye_pressure,
			String vdrl, String hiv) {
		super();
		this.order_id = order_id;
		this.doctor_id = doctor_id;
		this.patient_id = patient_id;
		this.clinic_id = clinic_id;
		this.date = date;
		this.return_date = return_date;
		this.weight = weight;
		this.sugar_level = sugar_level;
		this.bp = bp;
		this.lipid_profile = lipid_profile;
		this.hemoglobin = hemoglobin;
		this.vision = vision;
		this.eye_pressure = eye_pressure;
		this.vdrl = vdrl;
		this.hiv = hiv;
	}
	
	
	
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getClinic_id() {
		return clinic_id;
	}
	public void setClinic_id(int clinic_id) {
		this.clinic_id = clinic_id;
	}
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getReturn_date() {
		return return_date;
	}
	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getSugar_level() {
		return sugar_level;
	}
	public void setSugar_level(String sugar_level) {
		this.sugar_level = sugar_level;
	}
	public String getBp() {
		return bp;
	}
	public void setBp(String bp) {
		this.bp = bp;
	}
	public String getLipid_profile() {
		return lipid_profile;
	}
	public void setLipid_profile(String lipid_profile) {
		this.lipid_profile = lipid_profile;
	}
	public String getHemoglobin() {
		return hemoglobin;
	}
	public void setHemoglobin(String hemoglobin) {
		this.hemoglobin = hemoglobin;
	}
	public String getVision() {
		return vision;
	}
	public void setVision(String vision) {
		this.vision = vision;
	}
	public String getEye_pressure() {
		return eye_pressure;
	}
	public void setEye_pressure(String eye_pressure) {
		this.eye_pressure = eye_pressure;
	}
	public String getVdrl() {
		return vdrl;
	}
	public void setVdrl(String vdrl) {
		this.vdrl = vdrl;
	}
	public String getHiv() {
		return hiv;
	}
	public void setHiv(String hiv) {
		this.hiv = hiv;
	}
    
    
    
    
}
