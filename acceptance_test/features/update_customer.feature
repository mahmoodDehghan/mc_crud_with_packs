Feature: Update A CUSTOMER
  Scenario: edit customer infos and updates him in db
    GIVEN there is customer in db
    AND I wait until the "customer_edit" is present
    AND I tap the "customer_edit" icon
    AND I wait until the "email" is present
    WHEN I fill the "email" field with "mdm1369@gmail.com"
    AND I fill the "firstName" field with "Mahmood"
    AND I fill the "lastName" field with "Dehghan"
    AND I fill the "phone_number" field with "+989127606447"
    AND I fill the "bank_account" field with "1234567899"
    AND I tap the "changeDate" button
    AND I choose birthdate from picker
    AND I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I wait until the "done_message" is present 
    AND I expect the text "Customer updated!" to be present



  Scenario: update customer with existed email is not valid 
    GIVEN I wait until the "plus" is present
    AND I tap the "plus" icon
    AND I fill the "email" field with "alikhosh@gmail.com"
    AND I fill the "firstName" field with "ALI"
    AND I fill the "lastName" field with "KHOSH"
    AND I fill the "phone_number" field with "+989141346447"
    AND I fill the "bank_account" field with "1234545899"
    AND I tap the "changeDate" button
    AND I choose birthdate from picker
    AND I tap the "customer_save" button
    WHEN I fill the "email" field with "asdW@sad.sd"
    AND I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I wait until the "error_message" is present
    AND I expect the message "this email already registered!" to be shown   
    

  Scenario: update customer with existed person is not valid 
    GIVEN I wait until the "plus" is present
    AND I tap the "plus" icon
    AND I fill the "email" field with "alikhosh@gmail.com"
    AND I fill the "firstName" field with "Mahmood"
    AND I fill the "lastName" field with "Dehghan"
    AND I fill the "phone_number" field with "+989141346447"
    AND I fill the "bank_account" field with "1234536499"
    AND I tap the "changeDate" button
    AND I choose 364 days before min date from picker
    AND I tap the "customer_save" button
    WHEN I tap the "changeDate" button
    AND I choose birthdate from picker
    AND I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I wait until the "error_message" is present
    AND I expect the message "person with these details already registered!" to be shown

  Scenario: update customer with empty field is not valid 
    GIVEN there is customer in db
    AND I wait until the "customer_edit" is present
    AND I tap the "customer_edit" icon
    AND I wait until the "email" is present
    WHEN I fill the "firstName" field with ""
    AND I fill the "email" field with ""
    AND I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I wait until the "error_message" is present
    AND I expect the message "Please fill the form carefully!" to be shown    