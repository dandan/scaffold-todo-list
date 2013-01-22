
Feature: Edit Category
  As a user
  I can edit a category

  Background:
    Given the following "categories" exist:
      | id | name            | description                 |
      | 1  | Home            | Things about the house      |
      | 2  | Work            | Office related              |
      | 3  | Free Time       | Fun                         |
    And I visit "/categories/3/edit"

  Scenario: Show and update category
    Then I should see the main heading is "Editing category"
    And I should see the "category_name" input field value is: "Free Time"
    And I should see the "category_description" input field value is: "Fun"
    When I fill in "category_name" field with "Sport"
    And I fill in "category_description" field with "Bla bla bla"
    And I click the "Update Category" button
    Then I should see the flash notice: "Category was successfully updated"
    Then I should be at the path "/categories/3"
    Then I should see the main heading is "Category: Sport"
    And I should see the "description" field is: "Bla bla bla"

  Scenario: Show link
    And I click on the first "Show" link
    Then I should be at the path "/categories/3"

  Scenario: Back link
    And I click on the first "Back" link
    Then I should be at the path "/categories"

