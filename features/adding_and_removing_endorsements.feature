Feature: Adding and removing endorsements

  Background:
    Given these Ideas:
      | title                     | body                      |
      | An awesome idea           | The awesome body          |
    And these Endorsements on "An awesome idea":
      | name      |
      | Joe Smith |
      
  Scenario: I can see the Endorsements on an existing Idea
    When I go to the Idea page for "An awesome idea"
    Then I should see all of:
      | text                  |
      | Currently endorsed by |
      | x Joe Smith           |
  
  Scenario: I can add an Endorsement to an existing Idea
    When I go to the Idea page for "An awesome idea"
    And I fill in "endorsement[name]" with "Terry Franks"
    And I press "Endorse"
    Then I should see all of:
      | text                  |
      | Currently endorsed by |
      | x Joe Smith           |
      | x Terry Franks        |
      
  Scenario: I can remove any endorsement
    When I go to the Idea page for "An awesome idea"
    Then there should be 1 Endorsement on "An awesome idea"
    When I follow "x"
    Then there should be 0 Endorsements on "An awesome idea"
    
