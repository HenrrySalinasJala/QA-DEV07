Feature: Delete Epics
  As a user
  i want to delete epics of my project
  because i need to make it easier to plan and track progress of large features at a high level

  Background: set connection to pivotal tracker API REST
    Given I have set a connection to pivotal_tracker API service

  @smoke_test
  Scenario: delete a  epic
    Given I have a project created on pivotal tracker
    And I have the id of that project
    And I have the epic id to delete
    When I send an epic DELETE request to epics endpoint
    Then I expect a delete status code 204

