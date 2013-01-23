
Feature: List Tasks
  As a user
  I can see and edit a list of tasks

  Background:
    Given the following "categories" exist:
      | id | name            | description                 |
      | 1  | Home            | Things about the house      |
    Given the following "lists" exist:
      | category_id | id | name            | description                 |
      | 1           | 1  | Shopping        | Food & beverages            |
    Given the following "tasks" exist:
      | list_id | id | name            | description                 |
      | 1       | 1  | Eggs            | 12                          |
      | 1       | 2  | Milk            | Fresh milk if possible      |
      | 1       | 3  | Chocolate       | Om nom nom                  |
    And I visit "/categories/1/lists/1/tasks"

  Scenario: Show task list
    Then I should see the main heading is "Tasks"
    And I should see the following "3" "tasks":
      | name            | description                 |
      | Eggs            | 12                          |
      | Milk            | Fresh milk if possible      |
      | Chocolate       | Om nom nom                  |

  Scenario: Delete task link
    Then I should see "3" "tasks"
    When I click on the first "Destroy" link
    Then I should see the following "2" "tasks":
      | name            | description                 |
      | Milk            | Fresh milk if possible      |
      | Chocolate       | Om nom nom                  |

  Scenario: Show task link
    And I click on the first "Show" link
    Then I should be at the path "/categories/1/lists/1/tasks/1"

  Scenario: Edit task link
    And I click on the first "Edit" link
    Then I should be at the path "/categories/1/lists/1/tasks/1/edit"
