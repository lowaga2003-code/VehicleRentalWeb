package com.rental.driver;

public class Driver {
    private String driverId;
    private String name;
    private String nic;
    private String licenseNumber;
    private String phone;
    private String address;
    private boolean available;
    private String assignedVehicleId;

    public Driver(String driverId,String name,String nic,String licenseNumber,String phone,String address,boolean available,String assignedVehicleId){
        this.driverId=driverId;
        this.name=name;
        this.licenseNumber=licenseNumber;
        this.phone=phone;
        this.address=address;
        this.available=available;
        this.assignedVehicleId=assignedVehicleId;
    }


}
