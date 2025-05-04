package com.hospital.model;

public class Patient {
    private int id;
    private String patientName;
    private String patientDob;
    private String clinicId;
    private String gender;
    private String blood_type;
    private String patientAddress;
    private String patientNic;
    private String patientContactNo;
    private String patientGuardianName;
    private String patientGuardianContactNo;

    public Patient() {}

    public Patient(int id, String patientName, String patientDob, String clinicId,String gender,String blood_type,
                  String patientAddress, String patientNic, String patientContactNo,
                  String patientGuardianName, String patientGuardianContactNo) {
        this.id = id;
        this.patientName = patientName;
        this.patientDob = patientDob;
        this.clinicId = clinicId;
        this.gender=gender;
        this.blood_type=blood_type;
        this.patientAddress = patientAddress;
        this.patientNic = patientNic;
        this.patientContactNo = patientContactNo;
        this.patientGuardianName = patientGuardianName;
        this.patientGuardianContactNo = patientGuardianContactNo;
    }

    // Getters
    public int getId() { return id; }
    public String getPatientName() { return patientName; }
    public String getPatientDob() { return patientDob; }
    public String getClinicId() { return clinicId; }
    public String getGender() { return gender; }
    public String getBloodType() { return blood_type; }
    public String getPatientAddress() { return patientAddress; }
    public String getPatientNic() { return patientNic; }
    public String getPatientContactNo() { return patientContactNo; }
    public String getPatientGuardianName() { return patientGuardianName; }
    public String getPatientGuardianContactNo() { return patientGuardianContactNo; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setPatientName(String patientName) { this.patientName = patientName; }
    public void setPatientDob(String patientDob) { this.patientDob = patientDob; }
    public void setClinicId(String clinicId) { this.clinicId = clinicId; }
    public void setGender(String gender) { this.gender=gender; }
    public void setBloodType(String bloodType) { this.blood_type=bloodType; }
    public void setPatientAddress(String patientAddress) { this.patientAddress = patientAddress; }
    public void setPatientNic(String patientNic) { this.patientNic = patientNic; }
    public void setPatientContactNo(String patientContactNo) { this.patientContactNo = patientContactNo; }
    public void setPatientGuardianName(String patientGuardianName) { this.patientGuardianName = patientGuardianName; }
    public void setPatientGuardianContactNo(String patientGuardianContactNo) { this.patientGuardianContactNo = patientGuardianContactNo; }
}