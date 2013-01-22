
Feature: List Categories
  As a user
  I can see and edit a list of categories

  Background:
    Given the following "categories" exist:
      | id | name            | description                 |
      | 1  | Home            | Things about the house      |
      | 3  | Work            | Office related              |
      | 5  | Free Time       | Fun                         |
    And I visit "/categories"

  Scenario: Show category list
    Then I should see the main heading is "Categories"
    And I should see the following "3" "categories":
      | name            | description                 |
      | Home            | Things about the house      |
      | Work            | Office related              |
      | Free Time       | Fun                         |

  Scenario: Delete category link
    Then I should see "3" "categories"
    When I click on the first "Destroy" link
    Then I should see the following "2" "categories":
      | name            | description                 |
      | Work            | Office related              |
      | Free Time       | Fun                         |

  Scenario: Show category link
    And I click on the first "Show" link
    Then I should be at the path "/categories/1"

  Scenario: Edit category link
    And I click on the first "Edit" link
    Then I should be at the path "/categories/1/edit"
