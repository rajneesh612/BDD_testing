Feature: Dashboard
  As a logged-in user
  I want to see my dashboard
  So that I can access all application features

  Background:
    Given the user navigates to the login page
    And the user enters valid credentials

  @smoke @dashboard
  Scenario: Dashboard is displayed after login
    Then the user should be redirected to the dashboard

  @regression @dashboard
  Scenario: Dashboard contains main navigation menu
    Then the user should be redirected to the dashboard
    And the navigation menu should be visible

  @regression @dashboard
  Scenario: User can log out from the dashboard
    Then the user should be redirected to the dashboard
    When the user clicks the logout button
    Then the user should be redirected to the login page

  @regression @dashboard
  Scenario: User can check from the dashboard
    Then the user should be redirected to the dashboard
    When the user clicks the logout button
    Then the user should be redirected to the login page
