Feature: FullName

  Scenario: first name is required!
    GIVEN I tap the "firstName" field
    WHEN I tap the "lastName" field
    THEN I expect the text "FirstName is Required!" to be present


  Scenario: last name is required!
    GIVEN I tap the "lastName" field
    WHEN I tap the "firstName" field
    THEN I expect the text "LastName is Required!" to be present  

  Scenario: when both filled right the fullName is apeared
    GIVEN I expect the "lastName" field and "firstName" field to be present
    WHEN I fill the "firstName" field with "Mahmood" and I fill the "lastName" with "Dehghan"
    THEN I expect the text "Hello Mahmood Dehghan!" to be present  