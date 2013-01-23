
Feature: New Task
  As a user
  I can create a new task

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
    And I visit "/categories/1/lists/1/tasks/new"

  Scenario: Create new task
    Then I should see the main heading is "New task"
    When I fill in "task_name" field with "Beer"
    And I fill in "task_description" field with "Is yummy"
    And I click the "Create Task" button
    Then I should see the flash notice: "Task was successfully created"
    Then I should be at the path "/categories/1/lists/1/tasks/2"
    Then I should see the main heading is "Task: Beer"
    And I should see the "description" field is: "Is yummy"

  Scenario: Back link
    And I click on the first "Back" link
    Then I should be at the path "/categories/1/lists/1/tasks"

