package com.rental.customer;
import com.rental.utils.CustomerList; // Import YOUR custom list!


import java.io.*;

public class CustomerFileManager {
    // The text file will be created in your project folder
    private static final String FILE_PATH = "customers.txt";

    // --- SAVE A CUSTOMER TO THE FILE ---
    public void saveCustomer(Customer customer) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(customer.toFileString());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error saving customer: " + e.getMessage());
        }
    }

    // --- LOAD ALL CUSTOMERS FROM THE FILE INTO YOUR CUSTOM LIST ---
    public CustomerList getAllCustomers() {
        CustomerList customerList = new CustomerList(); // Using your custom class!
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            return customerList;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");

                if (data.length == 6) {
                    if (data[4].equals("Local")) {
                        customerList.add(new LocalCustomer(data[0], data[1], data[2], data[3], data[5]));
                    } else if (data[4].equals("Foreign")) {
                        customerList.add(new ForeignTourist(data[0], data[1], data[2], data[3], data[5]));
                    }
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        }

        return customerList;
    }
}