
Feature: Show Category
  As a user
  I can see the show page for a category

  Background:
    Given the following "categories" exist:
      | id | name            | description                 |
      | 1  | Home            | Things about the house      |
      | 2  | Work            | Office related              |
      | 3  | Free Time       | Fun                         |

  Scenario: Show category name and description
    When I visit "/categories/3"
    Then I should see the main heading is "Category: Free Time"
    And I should see the "description" field is: "Fun"

  Scenario: Edit link
    When I visit "/categories/3"
    And I click on the first "Edit" link
    Then I should be at the path "/categories/3/edit"

  Scenario: Back link
    When I visit "/categories/3"
    And I click on the first "Back" link
    Then I should be at the path "/categories"

  Scenario: New list link
    When I visit "/categories/3"
    And I click on the first "New List" link
    Then I should be at the path "/categories/3/lists/new"
