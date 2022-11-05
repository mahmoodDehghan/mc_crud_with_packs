Feature: Pick Email

  Scenario: Filled Email Should not be empty
    Given I tap the "email" field
    When I tap the "otherInput" field 
    Then I expect the text "Email is Required!" to be present

  Scenario: Filled Email with wrong format is not valid 
    Given I tap the "email" field
    When I fill the "email" field with "someonecom" 
    Then I expect the text "Please ensure the email entered is valid!" to be present

  Scenario: Filled Email with right format is valid 
    Given I tap the "email" field
    When I fill the "email" field with "someone@gmail.com" 
    Then I expect the text "Please ensure the email entered is valid!" to be absent    