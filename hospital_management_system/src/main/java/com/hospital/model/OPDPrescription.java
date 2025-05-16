package com.hospital.model;

public class OPDPrescription {
    private int orderId;
    private int doctorId;
    private int prescriptionId;
    private int routine;
    private int qty;
    private int days;

    public OPDPrescription(int orderId, int doctorId, int prescriptionId, int routine, int qty, int days) {
        this.orderId = orderId;
        this.doctorId = doctorId;
        this.prescriptionId = prescriptionId;
        this.routine = routine;
        this.qty = qty;
        this.days = days;
    }

    public OPDPrescription() {
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
