package com.hospital.model;

public class OPDOrder {
    private int id;
    private String patientName;
    private int patientAge;
    private int tolkenNo;
    private int doctorComplete;
    private int counterComplete;

    public OPDOrder() {
    }

    public OPDOrder(int id, String patientName, int patientAge, int tolkenNo, int doctorComplete, int counterComplete) {
        this.id = id;
        this.patientName = patientName;
        this.patientAge = patientAge;
        this.tolkenNo = tolkenNo;
        this.doctorComplete = doctorComplete;
        this.counterComplete = counterComplete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getPatientAge() {
        return patientAge;
    }

    public void setPatientAge(int patientAge) {
        this.patientAge = patientAge;
    }

    public int getTolkenNo() {
        return tolkenNo;
    }

    public void setTolkenNo(int tolkenNo) {
        this.tolkenNo = tolkenNo;
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
