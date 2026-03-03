package org.example.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

/**
 * Page Object for the Login page.
 */
public class LoginPage extends BasePage {

    // Locators
    private final By usernameField   = By.name("username");
    private final By passwordField   = By.name("password");
    private final By loginButton     = By.cssSelector("button[type='submit']");
    private final By errorMessage    = By.cssSelector(".error-message");
    private final By dashboardHeader = By.xpath("//h6[normalize-space()='Dashboard']");

    public LoginPage(WebDriver driver) {
        super(driver);
    }

    public void open(String url) {
        navigateTo(url);
    }

    public void enterUsername(String username) {
        sendKeys(usernameField, username);
    }

    public void enterPassword(String password) {
        sendKeys(passwordField, password);
    }

    public void clickLogin() {
        click(loginButton);
    }

    public void login(String username, String password) {
        enterUsername(username);
        enterPassword(password);
        clickLogin();
    }

    public boolean isDashboardDisplayed() {
        return isDisplayed(dashboardHeader);
    }

    public String getErrorMessage() {
        return getText(errorMessage);
    }

    public boolean isErrorDisplayed() {
        return isDisplayed(errorMessage);
    }
}
