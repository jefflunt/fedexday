Feature: Adding comments to Ideas

  Background:
    Given these Ideas:
      | title                       | body                                |
      | An idea ripe for discussion | The body that needs more discussion |
    And these Comments on "An idea ripe for discussion":
      | comment                             |
      | I have something to say about this! |
      
  Scenario: I can see existing Comments on Ideas
    When I go to the Idea page for "An idea ripe for discussion"
    Then I should see all of:
      | comment                             |
      | Comments                            |
      | New comment                         |
      | I have something to say about this! |
      
  Scenario: I can add a new comment to an existing Idea
    When I go to the Idea page for "An idea ripe for discussion"
    And I fill in "comment[body]" with "My comment is even more insightful!"
    And I press "Add comment"
    Then I should see all of:
      | comment                             |
      | less than a minute ago              |
      | My comment is even more insightful! |
