
Feature: Show List
  As a user
  I can see the show page for a list

  Background:
    Given the following "categories" exist:
      | id | name            | description                 |
      | 1  | Home            | Things about the house      |
    Given the following "lists" exist:
      | category_id | id | name            | description                 |
      | 1           | 1  | Shopping        | Food & beverages            |
      | 1           | 2  | DIY             | Fix my house                |
      | 1           | 5  | Family          | Duty calls                  |

  Scenario: Show list name and description
    When I visit "/categories/1/lists/1"
    Then I should see the main heading is "List: Shopping"
    And I should see the "description" field is: "Food & beverages"

  Scenario: Edit link
    When I visit "/categories/1/lists/1"
    And I click on the first "Edit" link
    Then I should be at the path "/categories/1/lists/1/edit"

  Scenario: Back link
    When I visit "/categories/1/lists/1"
    And I click on the first "Back" link
    Then I should be at the path "/categories/1/lists"

