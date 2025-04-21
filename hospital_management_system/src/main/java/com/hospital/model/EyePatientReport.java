package com.hospital.model;

public class EyePatientReport { 

	
private int id; 
private String name; 
private String nic; 
 


public EyePatientReport() {

}

public EyePatientReport(String name, String nic) {
	super();
	
	this.name = name;
	this.nic = nic;
}


public EyePatientReport(int id, String name, String nic) {
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
