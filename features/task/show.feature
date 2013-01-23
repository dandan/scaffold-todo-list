
Feature: Show Task
  As a user
  I can see the show page for a task

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
    And I visit "/categories/1/lists/1/tasks/1"

  Scenario: Show task name and description
    Then I should see the main heading is "Task: Eggs"
    And I should see the "description" field is: "12"

  Scenario: Edit link
    And I click on the first "Edit" link
    Then I should be at the path "/categories/1/lists/1/tasks/1/edit"

  Scenario: Back link
    And I click on the first "Back" link
    Then I should be at the path "/categories/1/lists/1/tasks"

