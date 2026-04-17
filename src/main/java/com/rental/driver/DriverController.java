package com.rental.driver;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DriverController {

    private DriverService driverService = new DriverService();

    @GetMapping("/driver")
    public String showDriverPage(Model model) {
        Driver[] drivers = driverService.getAllDrivers();
        int count = driverService.getAllDriverCount();

        model.addAttribute("drivers", drivers);
        model.addAttribute("count", count);

        return "driverManagement";
    }

    @PostMapping("/driver/add")
    public String addDriver(
            @RequestParam String driverId,
            @RequestParam String name,
            @RequestParam String nic,
            @RequestParam String licenseNumber,
            @RequestParam String phone,
            @RequestParam String address,
            @RequestParam boolean available,
            @RequestParam(required = false) String assignedVehicleId,
            @RequestParam String driverType,
            @RequestParam(required = false, defaultValue = "0") double monthlySalary,
            @RequestParam(required = false, defaultValue = "0") int tripsCompleted,
            @RequestParam(required = false, defaultValue = "0") double commissionPerTrip
    ) {
        if (assignedVehicleId == null || assignedVehicleId.trim().equals("")) {
            assignedVehicleId = "none";
        }

        Driver driver;

        if (driverType.equals("FullTime")) {
            driver = new FullTimeDriver(
                    driverId, name, nic, licenseNumber,
                    phone, address, available,
                    assignedVehicleId, monthlySalary
            );
        } else {
            driver = new FreelanceDriver(
                    driverId, name, nic, licenseNumber,
                    phone, address, available,
                    assignedVehicleId, tripsCompleted, commissionPerTrip
            );
        }

        driverService.addDriver(driver);
        return "redirect:/driver";
    }

    @PostMapping("/driver/delete")
    public String deleteDriver(@RequestParam String licenseNumber) {
        driverService.deleteDriver(licenseNumber);
        return "redirect:/driver";
    }

    @PostMapping("/driver/updateAvailability")
    public String updateAvailability(
            @RequestParam String licenseNumber,
            @RequestParam boolean available
    ) {
        driverService.updateDriverAvailability(licenseNumber, available);
        return "redirect:/driver";
    }
}
