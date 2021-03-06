Feature: Get Comments

  Background: Connection
    Given I have set a connection to pivotal_tracker API service

   @smoke_test
  Scenario: getting comments request from a User Story

    When I send a GET request to /projects/1601145/stories/120813473/comments
    Then I expect Status code 200

   @smoke_test
  Scenario: getting individual comment request from a User Story

    When I send a GET request
    Then I expect Status code 200

  @functional_test
  Scenario Outline: verifying that three parameters of a comment is an  integer value
    When I send a GET request
    And I validate <integer_parameter> parameter of a comment
    And I validate this integer parameters
    Then I should receive true as an answer for integer values
    Examples:
      | integer_parameter |
      | id                |
      | person_id         |
      | story_id          |

  @functional_test
  Scenario: verifying that a comment has seven parameters
    When I send a GET request
    And I validate that the json comment has 7 parameters
    Then I should receive true as an answer when the json has 7 numbers

  @functional_test
  Scenario Outline: verify that the value of a parameter is a String value
    When I send a GET request
    And I validate <string_parameter> parameter of a comment
    Then I should receive true as an answer for string values
    Examples:
      | string_parameter |
      | kind             |
      | text             |

  @functional_test
  Scenario Outline: verifying that the created and updated value are correct
    When I send a GET request
    And I validate <date_parameter> parameter of a comment
    Then I should receive true as an answer for <date_parameter> values
    Examples:
      | date_parameter |
      | created_at     |
      | updated_at     |

  @functional_test
  Scenario: verify that the comment text has 2000 characters
    When I send a GET request
    And I validate that text comment has between 1 and 20000 characters
    Then I should receive true as an answer for text_length values

  @negative_test
  Scenario: verify that there is not possible to get a comment with invalid id
    When I send a GET request to /projects/1601145/stories/120813473/comments/787788
    Then I expect bad request 404
