package com.hospital.model;

public class Attendance {
    private int id;
    private int userId;
    private java.sql.Timestamp loginTime;
    private java.sql.Timestamp logoutTime;
    private String status;

    public Attendance() {
    }

    public Attendance(int id, int userId, java.sql.Timestamp loginTime, java.sql.Timestamp logoutTime, String status) {
        this.id = id;
        this.userId = userId;
        this.loginTime = loginTime;
        this.logoutTime = logoutTime;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public java.sql.Timestamp getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(java.sql.Timestamp loginTime) {
        this.loginTime = loginTime;
    }

    public java.sql.Timestamp getLogoutTime() {
        return logoutTime;
    }

    public void setLogoutTime(java.sql.Timestamp logoutTime) {
        this.logoutTime = logoutTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   

}
