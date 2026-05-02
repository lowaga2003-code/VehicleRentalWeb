package com.rental.bookingAnDreturn;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class BookingFileManager {
    private static final String FILE_PATH = "bookings.txt";

    // --- SAVE A BOOKING ---
    public void saveBooking(Booking booking) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(booking.toFileString());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error saving booking: " + e.getMessage());
        }
    }

    // --- LOAD ALL BOOKINGS ---
    public List<Booking> getAllBookings() {
        List<Booking> bookingList = new ArrayList<>();
        File file = new File(FILE_PATH);

        if (!file.exists()) return bookingList;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                // Rebuild the Booking object
                Booking b = new Booking(data[0], data[1], data[2], Integer.parseInt(data[3]), Double.parseDouble(data[4]));
                bookingList.add(b);
            }
        } catch (IOException e) {
            System.out.println("Error loading bookings: " + e.getMessage());
        }
        return bookingList;
    }
    // --- RETURN A VEHICLE (DELETE THE BOOKING) ---
    public void deleteBooking(String bookingId) {
        // 1. Get all existing bookings
        List<Booking> allBookings = getAllBookings();

        // 2. Open the file in OVERWRITE mode (false means it wipes the file)
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {

            // 3. Write everyone back EXCEPT the one we are deleting
            for (Booking b : allBookings) {
                if (!b.getBookingId().equals(bookingId)) {
                    writer.write(b.toFileString());
                    writer.newLine();
                }
            }
            System.out.println("Booking " + bookingId + " removed successfully.");

        } catch (IOException e) {
            System.out.println("Error deleting booking: " + e.getMessage());
        }
    }
}