Feature: Remove A CUSTOMER
  Scenario: confirm dialog for remove a customer from list and db
    GIVEN I wait until the "customer_delete" is present
    WHEN I tap the "customer_delete" icon
    THEN I wait until the "confirm" is present
     

  Scenario: confirm remove a customer from list and db by tapping yes 
    GIVEN I wait until the "customer_delete" is present
    WHEN I tap the "customer_delete" icon
    AND I wait until the "customer_delete_yes" is present
    AND I tap the "customer_delete_yes" button
    THEN I expect the text "1 : Mahmood Dehghan" to be absent 

  Scenario: unconfirm remove a customer from list and db by tapping no 
    GIVEN I wait until the "customer_delete" is present
    WHEN I tap the "customer_delete" icon
    AND I wait until the "customer_delete_no" is present
    AND I tap the "customer_delete_no" button
    THEN I wait until the "confirm" is absent 
    AND I expect the text "1 : Mahmood Dehghan" to be present
    
       