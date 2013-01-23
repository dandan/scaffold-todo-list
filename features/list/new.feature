
Feature: New List
  As a user
  I can create a new list

  Background:
    Given the following "categories" exist:
      | id | name            | description                 |
      | 1  | Home            | Things about the house      |
    Given the following "lists" exist:
      | category_id | id | name            | description                 |
      | 1           | 1  | Shopping        | Food & beverages            |
    And I visit "/categories/1/lists/new"

  Scenario: Create new category
    Then I should see the main heading is "New list"
    When I fill in "list_name" field with "Sport"
    And I fill in "list_description" field with "Bla bla bla"
    And I click the "Create List" button
    Then I should see the flash notice: "List was successfully created"
    Then I should be at the path "/categories/1/lists/2"
    Then I should see the main heading is "List: Sport"
    And I should see the "description" field is: "Bla bla bla"

  Scenario: Back link
    And I click on the first "Back" link
    Then I should be at the path "/categories/1/lists"

