Feature: User Registration
  As a new visitor
  I want to register for an account
  So that I can access the application

  @smoke @registration
  Scenario: Successful registration with valid details
    Given the user navigates to the registration page
    When the user fills in the registration form with valid details
    Then the user should see a registration success message

  @regression @registration
  Scenario: Registration fails when email is already in use
    Given the user navigates to the registration page
    When the user fills in the registration form with an existing email "test@example.com"
    Then an error message "Email address is already registered." should be displayed

  @regression @registration
  Scenario Outline: Registration form field validations
    Given the user navigates to the registration page
    When the user submits the form with "<field>" left empty
    Then a validation error "<validationMessage>" should appear for "<field>"

    Examples:
      | field         | validationMessage              |
      | firstName     | First name is required.        |
      | lastName      | Last name is required.         |
      | email         | Email address is required.     |
      | password      | Password is required.          |
      | confirmPassword | Passwords do not match.      |

  @regression @registration
  Scenario: Password strength validation
    Given the user navigates to the registration page
    When the user enters a weak password "123"
    Then a password strength error "Password must be at least 8 characters." should be displayed
