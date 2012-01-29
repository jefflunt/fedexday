Feature: Idea lists, editing, updating, and scratching

  Background:
    Given these Ideas:
      | title                     | body                      |
      | A new idea                | The new body              |
      | An even newer idea        | An even newer body        |
      | The absolute newest idea  | The absolute newest body  |

  Scenario: I can see a list of Ideas on the index page
    When I go to the Ideas index page
    Then I should see all of:
      | text                      |
      | Ideas                     |
      | Comments                  |
      | Last activity             |
      | A new idea                |
      | An even newer idea        |
      | The absolute newest idea  |
      
  Scenario: I can view an Idea on its own page
    When I go to the Idea page for "A new idea"
    Then I should see "The new body"
  
  Scenario: I can get to a given Idea from the index page
    When I go to the Ideas index page
    And I follow "A new idea"
    Then I should see "The new body"
    
  Scenario: I can edit a scenario, with all the editing controls
    When I go to the edit Idea page for "A new idea"
    Then I should see all of:
      | text                                |
      | Edit idea                           |
      | Write a brief outline of your idea. |
      | Title                               |
      | Summary                             |
    
  Scenario: I can change the title of an Idea
    When I go to the edit Idea page for "A new idea"
    And I fill in "idea_title" with "An old idea"
    And I press "Update Idea"
    Then I should see all of:
      | text                          |
      | Idea was successfully updated |
      | An old idea                   |
      
  Scenario: I can scratch out an idea
    When I go to the Ideas index page
    Then there should be 0 Ideas scratched out
    When I follow "X"
    Then there should be 1 Idea scratched out
