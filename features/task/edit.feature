
Feature: Edit Task
  As a user
  I can edit a task

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
    And I visit "/categories/1/lists/1/tasks/1/edit"

  Scenario: Show and update list
    Then I should see the main heading is "Editing task"
    And I should see the "task_name" input field value is: "Eggs"
    And I should see the "task_description" input field value is: "12"
    When I fill in "task_name" field with "Beer"
    And I fill in "task_description" field with "For hot days"
    And I click the "Update Task" button
    Then I should see the flash notice: "Task was successfully updated"
    Then I should be at the path "/categories/1/lists/1/tasks/1"
    Then I should see the main heading is "Task: Beer"
    And I should see the "description" field is: "For hot days"

  Scenario: Show link
    When I click on the first "Show" link
    Then I should be at the path "/categories/1/lists/1/tasks/1"

  Scenario: Back link
    And I click on the first "Back" link
    Then I should be at the path "/categories/1/lists/1/tasks"

