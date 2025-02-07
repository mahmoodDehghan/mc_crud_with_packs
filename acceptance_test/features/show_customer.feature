Feature: Show A CUSTOMER List
  Scenario: select a customer from a list
    GIVEN I wait until the "Customer_List" is present
    WHEN I tap the "list_item1"
    THEN I expect the text "Mahmood" to be present
    AND I expect the text "Dehghan" to be present
    AND I expect the text "asdW@sad.sd" to be present
    AND I expect the text "213345123" to be present
    AND I expect the text "+989122345643" to be present
    AND I expect the birthdate is shown
