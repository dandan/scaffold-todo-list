
Feature: Edit List
  As a user
  I can edit a list

  Background:
    Given the following "categories" exist:
      | id | name            | description                 |
      | 1  | Home            | Things about the house      |
    Given the following "lists" exist:
      | category_id | id | name            | description                 |
      | 1           | 1  | Shopping        | Food & beverages            |
    And I visit "/categories/1/lists/1/edit"

  Scenario: Show and update list
    Then I should see the main heading is "Editing list"
    And I should see the "list_name" input field value is: "Shopping"
    And I should see the "list_description" input field value is: "Food & beverages"
    When I fill in "list_name" field with "Sport"
    And I fill in "list_description" field with "Bla bla bla"
    And I click the "Update List" button
    Then I should see the flash notice: "List was successfully updated"
    Then I should be at the path "/categories/1/lists/1"
    Then I should see the main heading is "List: Sport"
    And I should see the "description" field is: "Bla bla bla"

  Scenario: Show link
    And I click on the first "Show" link
    Then I should be at the path "/categories/1/lists/1"

  Scenario: Back link
    And I click on the first "Back" link
    Then I should be at the path "/categories/1/lists"

