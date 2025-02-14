Feature: ADD A CUSTOMER
  Scenario: add customer infos and saves him in db
    GIVEN I wait until the "plus" is present
    AND I tap the "plus" icon
    AND I tap the "firstName" field
    AND I fill the "firstName" field with "ALI"
    AND I tap the "lastName" field
    AND I fill the "lastName" field with "KHOSH"
    AND I tap the "email" field
    AND I fill the "email" field with "alikhosh@gmail.com"
    AND I tap the "phone_number" field
    AND I fill the "phone_number" field with "+989141346447"
    AND I tap the "bank_account" field
    AND I fill the "bank_account" field with "1234536458"
    AND I tap the "changeDate" button
    AND I choose birthdate from picker
    WHEN I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I wait until the "done_message" is present
    AND I expect the text "Customer saved!" to be present 

  Scenario: empty field is not valid
    GIVEN I wait until the "plus" is present
    AND I tap the "plus" icon
    AND I fill the "email" field with ""
    AND I fill the "firstName" field with "ALI"
    AND I fill the "lastName" field with "KHOSH"
    AND I fill the "phone_number" field with "+989141346447"
    AND I fill the "bank_account" field with "123453645"
    AND I tap the "changeDate" button
    AND I choose birthdate from picker
    WHEN I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I wait until the "error_message" is present
    AND I expect the text "Please fill the form carefully!" to be present


  Scenario: change birth date is required
    GIVEN I wait until the "plus" is present
    AND I tap the "plus" icon
    AND I fill the "email" field with ""
    AND I fill the "firstName" field with "ALI"
    AND I fill the "lastName" field with "KHOSH"
    AND I fill the "phone_number" field with "+989141346447"
    AND I fill the "bank_account" field with "123453645"
    WHEN I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I wait until the "error_message" is present
    AND I expect the text "Please change Birth Date!" to be present    

  Scenario: same person is not valid in customer add
    GIVEN I wait until the "plus" is present
    WHEN I tap the "plus" icon
    AND I fill the "email" field with "asd@asd.asd"
    AND I fill the "firstName" field with "Mahmood"
    AND I fill the "lastName" field with "Dehghan"
    AND I fill the "phone_number" field with "+989141346447"
    AND I fill the "bank_account" field with "123453899"
    AND I tap the "changeDate" button
    AND I choose birthdate from picker
    AND I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I wait until the "error_message" is present
    AND I expect the text "person with these details already registered!" to be present
    

  Scenario: same email is not valid in customer add
    GIVEN I wait until the "plus" is present
    AND I tap the "plus" icon
    AND I fill the "email" field with "asdW@sad.sd"
    AND I fill the "firstName" field with "ALI"
    AND I fill the "lastName" field with "KHOSH"
    AND I fill the "phone_number" field with "+989141346447"
    AND I fill the "bank_account" field with "123453899"
    AND I tap the "changeDate" button
    AND I choose birthdate from picker
    WHEN I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I wait until the "error_message" is present
    AND I expect the message "this email already registered!" to be shown   


  Scenario: all fields are required
    GIVEN I wait until the "plus" is present
    AND I tap the "plus" icon
    AND I fill the "email" field with ""
    AND I fill the "firstName" field with ""
    AND I fill the "lastName" field with ""
    AND I fill the "phone_number" field with ""
    AND I fill the "bank_account" field with ""
    AND I tap the "changeDate" button
    AND I choose birthdate from picker
    WHEN I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I expect the message "Bank Account is Required!" to be shown
    AND I wait until the "error_message" is present
    AND I expect the message "Please fill the form carefully!" to be shown
    AND I long press the "lastName" field
    AND I expect the message "LastName is Required!" to be shown
    AND I long press the "firstName" field
    AND I expect the message "FirstName is Required!" to be shown
    AND I long press the "email" field
    AND I expect the message "Email is Required!" to be shown   
    AND I long press the "phone_number" field
    AND I expect the message "Phone number is Required!" to be shown 

  Scenario: invalid inputs
    GIVEN I wait until the "plus" is present
    AND I tap the "plus" icon
    AND I fill the "email" field with "asdsaf"
    AND I fill the "firstName" field with "test"
    AND I fill the "lastName" field with "test"
    AND I fill the "phone_number" field with "1234545"
    AND I fill the "bank_account" field with "1245"
    AND I tap the "changeDate" button
    AND I choose birthdate from picker
    WHEN I tap the "customer_save" button
    THEN I long press the "bank_account" field
    AND I expect the message "Please ensure the Bank Account entered is valid!" to be shown
    AND I wait until the "error_message" is present
    AND I expect the message "Please fill the form carefully!" to be shown
    AND I long press the "email" field
    AND I expect the message "Please ensure the email entered is valid!" to be shown
    AND I long press the "phone_number" field
    AND I expect the message "Invalid phone number!" to be shown    