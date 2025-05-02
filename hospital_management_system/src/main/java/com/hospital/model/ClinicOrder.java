package com.hospital.model;

import java.sql.Timestamp;

public class ClinicOrder {
    private int id;
    private int tolkenNo;
    private int clinicId;
    private int patientId;
    private Timestamp date;
    private int doctorComplete;
    private int counterComplete;

    public ClinicOrder() {
    }

    public ClinicOrder(int id, int tolkenNo, int clinicId, int patientId, Timestamp date, int doctorComplete, int counterComplete) {
        this.id = id;
        this.tolkenNo = tolkenNo;
        this.clinicId = clinicId;
        this.patientId = patientId;
        this.date = date;
        this.doctorComplete = doctorComplete;
        this.counterComplete = counterComplete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTolkenNo() {
        return tolkenNo;
    }

    public void setTolkenNo(int tolkenNo) {
        this.tolkenNo = tolkenNo;
    }

    public int getClinicId() {
        return clinicId;
    }

    public void setClinicId(int clinicId) {
        this.clinicId = clinicId;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getDoctorComplete() {
        return doctorComplete;
    }

    public void setDoctorComplete(int doctorComplete) {
        this.doctorComplete = doctorComplete;
    }

    public int getCounterComplete() {
        return counterComplete;
    }

    public void setCounterComplete(int counterComplete) {
        this.counterComplete = counterComplete;
    }

   
}
