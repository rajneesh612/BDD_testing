Feature: User Profile Management
  As a logged-in user
  I want to manage my profile
  So that I can keep my account information up to date

  Background:
    Given the user navigates to the login page
    And the user enters valid credentials
    And the user navigates to the profile page

  @smoke @profile
  Scenario: User can view their profile details
    Then the profile page should display the user's information

  @regression @profile
  Scenario: User can update their display name
    When the user updates the display name to "John Doe"
    And the user saves the profile changes
    Then a success message "Profile updated successfully." should be displayed
    And the display name should show "John Doe"

  @regression @profile
  Scenario: User can change their password
    When the user enters the current password "admin123"
    And the user enters the new password "NewPass@456"
    And the user confirms the new password "NewPass@456"
    And the user submits the password change
    Then a success message "Password changed successfully." should be displayed

  @regression @profile
  Scenario: Password change fails when current password is wrong
    When the user enters the current password "wrongPassword"
    And the user enters the new password "NewPass@456"
    And the user confirms the new password "NewPass@456"
    And the user submits the password change
    Then an error message "Current password is incorrect." should be displayed

  @regression @profile
  Scenario: Password change fails when new passwords do not match
    When the user enters the current password "admin123"
    And the user enters the new password "NewPass@456"
    And the user confirms the new password "DifferentPass@789"
    And the user submits the password change
    Then an error message "New passwords do not match." should be displayed
