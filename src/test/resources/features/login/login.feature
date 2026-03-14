Feature: User Login
  As a registered user
  I want to log in to the application
  So that I can access my dashboard

  Background:
    Given the user navigates to the login page

  @smoke @login
  Scenario: Successful login with valid credentials
    When the user enters valid credentials
    Then the user should be redirected to the dashboard

  @sanity @login
  Scenario: Successful login with valid credentials
    When the user enters valid credentials
    Then the user should be redirected to the dashboard


  @regression @login
  Scenario Outline: Login fails with invalid credentials
    When the user enters username "<username>" and password "<password>"
    Then an error message "<errorMessage>" should be displayed

    Examples:
      | username      | password    | errorMessage                      |
      | invalidUser   | wrongPass   | Invalid username or password.     |
      | admin         |             | Password is required.             |
      |               | admin123    | Username is required.             |
