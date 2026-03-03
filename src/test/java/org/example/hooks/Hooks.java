package org.example.hooks;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import org.example.utils.DriverManager;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;

/**
 * Cucumber lifecycle hooks for WebDriver setup and teardown.
 */
public class Hooks {

    @Before(order = 0)
    public void setUp(Scenario scenario) {
        System.out.println("▶ Starting scenario: " + scenario.getName());
        DriverManager.initDriver();
    }

    @After(order = 0)
    public void tearDown(Scenario scenario) {
        WebDriver driver = DriverManager.getDriver();

        if (scenario.isFailed() && driver != null) {
            byte[] screenshot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);
            scenario.attach(screenshot, "image/png", "Screenshot on failure");
            System.out.println("📸 Screenshot captured for failed scenario: " + scenario.getName());
        }

        DriverManager.quitDriver();
        System.out.println("⏹ Finished scenario: " + scenario.getName()
                + " | Status: " + scenario.getStatus());
    }
}
