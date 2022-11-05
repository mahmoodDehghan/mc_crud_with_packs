Feature: Pick Phone Number

  Scenario: Phone number is required!
    GIVEN I tap the "phone_number" field
    When I tap the "otherInput" field 
    Then I expect the text "Phone number is Required!" to be present

  Scenario: Filled Phone number with wrong format is not valid 
    Given I tap the "phone_number" field
    When I fill the "phone_number" field with "12345" 
    Then I expect the text "Invalid phone number!" to be present  

  Scenario: Filled Phone nuumber with right format is valid 
    Given I tap the "phone_number" field
    When I fill the "phone_number" field with right number 
    Then I expect the text "Invalid phone number!" to be absent  