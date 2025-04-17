package com.hospital.model;

import java.sql.Timestamp;

public class DoctorAttendance {
    private int doctorId;
    private Timestamp time;

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
}
