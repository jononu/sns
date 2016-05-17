@publish
Feature: Publish

  Background:
    Given AWS-SDK client

  Scenario: Publish
    Given I create a new topic "cucumber1"
    Given I create a new topic "cucumber2"
    And I subscribe endpoint "file://tmp?fileName=sns1.txt" with protocol "file" to topic "cucumber1"
    And I subscribe endpoint "file://tmp?fileName=sns2.txt" with protocol "file" to topic "cucumber2"
    When I publish a message "Hello, World!" to topic "cucumber1"
    When I publish a message "foo!" to topic "cucumber2"
    Then The publish request should be successful
    Then I sleep for 1 seconds
    Then I should see "Hello, World" in file "./tmp/sns1.txt"
    Then I should not see "Hello, World" in file "./tmp/sns2.txt"
