package com.hospital.model;

public class CardiologyPatientReport { 

	
private int id; 
private String name; 
private String nic; 
 


public CardiologyPatientReport() {

}

public CardiologyPatientReport(String name, String nic) {
	super();
	
	this.name = name;
	this.nic = nic;
}


public CardiologyPatientReport(int id, String name, String nic) {
	super();
	this.id = id;
	this.name = name;
	this.nic = nic;
}



public int getId() {
	return id;
}



public void setId(int id) {
	this.id = id;
}



public String getName() {
	return name;
}



public void setName(String name) {
	this.name = name;
}



public String getNic() {
	return nic;
}



public void setNic(String nic) {
	this.nic = nic;
}




} 
