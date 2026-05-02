package com.rental.bookingAnDreturn;

public class Booking {
    private String bookingId;
    private String customerId;
    private String vehicleId;
    private int numberOfDays;
    private double totalCost;

    public Booking(String bookingId, String customerId, String vehicleId, int numberOfDays, double totalCost) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.vehicleId = vehicleId;
        this.numberOfDays = numberOfDays;
        this.totalCost = totalCost;
    }

    public String getBookingId() { return bookingId; }
    public String getCustomerId() { return customerId; }
    public String getVehicleId() { return vehicleId; }
    public int getNumberOfDays() { return numberOfDays; }
    public double getTotalCost() { return totalCost; }

    public String toFileString() {
        return bookingId + "," + customerId + "," + vehicleId + "," + numberOfDays + "," + totalCost;
    }
}