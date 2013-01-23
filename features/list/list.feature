
Feature: List Lists
  As a user
  I can see and edit a list of lists

  Background:
    Given the following "categories" exist:
      | id | name            | description                 |
      | 1  | Home            | Things about the house      |
    Given the following "lists" exist:
      | category_id | id | name            | description                 |
      | 1           | 1  | Shopping        | Food & beverages            |
      | 1           | 2  | DIY             | Fix my house                |
      | 1           | 5  | Family          | Duty calls                  |
    And I visit "/categories/1/lists"

  Scenario: Show category list
    Then I should see the main heading is "Lists"
    And I should see the following "3" "lists":
      | name            | description                 |
      | Shopping        | Food & beverages            |
      | DIY             | Fix my house                |
      | Family          | Duty calls                  |

  Scenario: Delete list link
    Then I should see "3" "lists"
    When I click on the first "Destroy" link
    Then I should see the following "2" "lists":
      | name            | description                 |
      | DIY             | Fix my house                |
      | Family          | Duty calls                  |

  Scenario: Show list link
    And I click on the first "Show" link
    Then I should be at the path "/categories/1/lists/1"

  Scenario: Edit list link
    And I click on the first "Edit" link
    Then I should be at the path "/categories/1/lists/1/edit"
