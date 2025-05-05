  package com.hospital.model;

public class CounterMedicine {
    private int medicineId;
    private String medicineName;
    private int stockAvailability;
    private String dosage;
    private String prescribedFor;

    public CounterMedicine() {}

    public CounterMedicine(int medicineId, String medicineName, int stockAvailability, String dosage, String prescribedFor) {
        this.medicineId = medicineId;
        this.medicineName = medicineName;
        this.stockAvailability = stockAvailability;
        this.dosage = dosage;
        this.prescribedFor = prescribedFor;
    }

    // Getters
    public int getMedicineId() {
        return medicineId;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public int getStockAvailability() {
        return stockAvailability;
    }

    public String getDosage() {
        return dosage;
    }

    public String getPrescribedFor() {
        return prescribedFor;
    }

    // Setters
    public void setMedicineId(int medicineId) {
        this.medicineId = medicineId;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public void setStockAvailability(int stockAvailability) {
        this.stockAvailability = stockAvailability;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public void setPrescribedFor(String prescribedFor) {
        this.prescribedFor = prescribedFor;
    }
}
