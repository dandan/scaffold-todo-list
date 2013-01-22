
Feature: New Category
  As a user
  I can create a new category

  Background:
    Given the following "categories" exist:
      | id | name            | description                 |
      | 1  | Home            | Things about the house      |
    And I visit "/categories/new"

  Scenario: Create new category
    Then I should see the main heading is "New category"
    When I fill in "category_name" field with "Sport"
    And I fill in "category_description" field with "Bla bla bla"
    And I click the "Create Category" button
    Then I should see the flash notice: "Category was successfully created"
    Then I should be at the path "/categories/2"
    Then I should see the main heading is "Category: Sport"
    And I should see the "description" field is: "Bla bla bla"

  Scenario: Back link
    And I click on the first "Back" link
    Then I should be at the path "/categories"

