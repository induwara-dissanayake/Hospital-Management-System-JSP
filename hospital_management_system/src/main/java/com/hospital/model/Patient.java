package com.hospital.model;

public class Patient {

    private int id;
    private String patient_name;
    private String patient_dob;
    private String clinic_id;
    private String patient_address;
    private String patient_nic;
    private String patient_contact_no;
    private String patient_guardian_name;
    private String patient_guardian_contact_no;

    public Patient() {}

    public Patient(int id, String patient_name, String patient_dob, String clinic_id,
                   String patient_address, String patient_nic, String patient_contact_no,
                   String patient_guardian_name, String patient_guardian_contact_no) {
        this.id = id;
        this.patient_name = patient_name;
        this.patient_dob = patient_dob;
        this.clinic_id = clinic_id;
        this.patient_address = patient_address;
        this.patient_nic = patient_nic;
        this.patient_contact_no = patient_contact_no;
        this.patient_guardian_name = patient_guardian_name;
        this.patient_guardian_contact_no = patient_guardian_contact_no;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public String getPatient_dob() {
        return patient_dob;
    }

    public String getClinic_id() {
        return clinic_id;
    }

    public String getPatient_address() {
        return patient_address;
    }

    public String getPatient_nic() {
        return patient_nic;
    }

    public String getPatient_contact_no() {
        return patient_contact_no;
    }

    public String getPatient_guardian_name() {
        return patient_guardian_name;
    }

    public String getPatient_guardian_contact_no() {
        return patient_guardian_contact_no;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public void setPatient_dob(String patient_dob) {
        this.patient_dob = patient_dob;
    }

    public void setClinic_id(String clinic_id) {
        this.clinic_id = clinic_id;
    }

    public void setPatient_address(String patient_address) {
        this.patient_address = patient_address;
    }

    public void setPatient_nic(String patient_nic) {
        this.patient_nic = patient_nic;
    }

    public void setPatient_contact_no(String patient_contact_no) {
        this.patient_contact_no = patient_contact_no;
    }

    public void setPatient_guardian_name(String patient_guardian_name) {
        this.patient_guardian_name = patient_guardian_name;
    }

    public void setPatient_guardian_contact_no(String patient_guardian_contact_no) {
        this.patient_guardian_contact_no = patient_guardian_contact_no;
    }
}
