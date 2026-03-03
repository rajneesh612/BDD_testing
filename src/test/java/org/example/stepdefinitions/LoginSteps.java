package org.example.stepdefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.example.pages.LoginPage;
import org.example.utils.ConfigReader;
import org.example.utils.DriverManager;
import org.junit.jupiter.api.Assertions;

/**
 * Step definitions for login feature scenarios.
 */
public class LoginSteps {

    private final LoginPage loginPage = new LoginPage(DriverManager.getDriver());

    @Given("the user navigates to the login page")
    public void theUserNavigatesToTheLoginPage() {
        String baseUrl = ConfigReader.get("baseUrl");
        loginPage.open(baseUrl);
    }

    @When("the user enters valid credentials")
    public void theUserEntersValidCredentials() {
        String username = ConfigReader.get("validUsername", "admin");
        String password = ConfigReader.get("validPassword", "admin123");
        loginPage.login(username, password);
    }

    @When("the user enters username {string} and password {string}")
    public void theUserEntersUsernameAndPassword(String username, String password) {
        loginPage.login(username, password);
    }

    @Then("the user should be redirected to the dashboard")
    public void theUserShouldBeRedirectedToTheDashboard() {
        Assertions.assertTrue(loginPage.isDashboardDisplayed(),
                "Expected dashboard to be displayed after successful login.");
    }

    @Then("an error message {string} should be displayed")
    public void anErrorMessageShouldBeDisplayed(String expectedMessage) {
        Assertions.assertTrue(loginPage.isErrorDisplayed(),
                "Expected error message to be visible.");
        Assertions.assertEquals(expectedMessage, loginPage.getErrorMessage(),
                "Error message text mismatch.");
    }
}
