Feature: Forgot Password
  As a registered user who has forgotten their password
  I want to reset my password
  So that I can regain access to my account

  @smoke @forgot-password
  Scenario: User can request a password reset with a valid email
    Given the user navigates to the login page
    When the user clicks the "Forgot Password?" link
    And the user enters the email address "admin@example.com"
    And the user submits the password reset request
    Then a confirmation message "A password reset link has been sent to your email." should be displayed

  @regression @forgot-password
  Scenario: Password reset fails with an unregistered email
    Given the user navigates to the login page
    When the user clicks the "Forgot Password?" link
    And the user enters the email address "notregistered@example.com"
    And the user submits the password reset request
    Then an error message "No account found with that email address." should be displayed

  @regression @forgot-password
  Scenario: Password reset form validates empty email field
    Given the user navigates to the login page
    When the user clicks the "Forgot Password?" link
    And the user submits the password reset request
    Then a validation error "Email address is required." should be displayed
