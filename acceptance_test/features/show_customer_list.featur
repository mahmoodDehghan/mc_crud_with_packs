Feature: Show A CUSTOMER List
  Scenario: read and show all customers from db
    GIVEN I expect the "Customer_List" to be present
    WHEN there is customer in db
    THEN I expect the text "1 : Mahmood Dehghan" to be present
    

  Scenario: read and show all customers from db without any data
    GIVEN I expect the "Customer_List" to be present
    AND I wait until the "customer_delete" is present
    WHEN I tap the "customer_delete" icon
    AND I wait until the "customer_delete_yes" is present
    AND I tap the "customer_delete_yes" button
    THEN I expect the text "1 : Mahmood Dehghan" to be absent
    AND I expect the text "There is no customer!" to be present 


  Scenario: update all customers based on added new customer 
    GIVEN I expect the "Customer_List" to be present
    AND I wait until the "plus" is present
    WHEN I tap the "plus" icon
    AND I tap the "email" field
    AND I fill the "email" field with "ali@gmail.com"
    AND I tap the "firstName" field
    AND I fill the "firstName" field with "ALI"
    AND I tap the "lastName" field
    AND I fill the "lastName" field with "KHOSH"
    AND I tap the "phone_number" field
    AND I fill the "phone_number" field with "+989151346447"
    AND I tap the "bank_account" field
    AND I fill the "bank_account" field with "123453699"
    AND I tap the "changeDate" button
    AND I choose birthdate from picker
    AND I tap the "customer_save" button 
    AND I tap the back button
    THEN I wait until the "Customer_List" is present
    AND I expect the text "2 : ALI KHOSH" to be present


  Scenario: update customer list based on customer update action 
    GIVEN I wait until the "customer_edit" is present
    AND I tap the "customer_edit" icon
    AND I wait until the "firstName" is present
    WHEN I tap the "firstName" field
    AND I fill the "firstName" field with "sam"
    WHEN I tap the "lastName" field
    AND I fill the "lastName" field with "sami"
    AND I tap the "customer_save" button 
    AND I tap the back button
    THEN I wait until the "Customer_List" is present
    AND I expect the text "1 : sam sami" to be present  