Feature: pick bank account
  Scenario: bank account is required
    GIVEN I tap the "bank_account" field
    When I tap the "otherInput" field 
    Then I expect the text "Bank Account is Required!" to be present

  Scenario: Filled Bank Account with some number is valid 
    Given I tap the "bank_account" field
    When I fill the "bank_account" field with "123456789" 
    Then I expect the text "Bank Account is Required!" to be absent  

  Scenario: Filled Bank Account with some number is invalid 
    Given I tap the "bank_account" field
    When I fill the "bank_account" field with "123" 
    Then I expect the text "Please ensure the Bank Account entered is valid!" to be present
