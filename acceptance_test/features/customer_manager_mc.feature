Feature: Create Read Edit Delete Customer

  Background:
    Given system error codes are following
      | Code | Description                                                |
      | 101  | Invalid Mobile Number                                      |
      | 102  | Invalid Email address                                      |
      | 103  | Invalid Bank Account Number                                |
      | 201  | Duplicate customer by First-name, Last-name, Date-of-Birth |
      | 202  | Duplicate customer by Email address                        |


  @ignore
  Scenario: Create Read Edit Delete Customer
    When user creates a customer with following data by clicking submit and typing below data
      | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber |
      | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR000000000000001 |
    Then user can get list of all customers and there must be "1" record with below details
      | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber |
      | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR000000000000001 |
    When user edit customer with new data
      | FirstName | LastName     | Email            | PhoneNumber | DateOfBirth | BankAccountNumber |
      | Jane      | William      | jane@william.com | +3161234567 | 01-FEB-2010 | IR000000000000002 |
    Then user can get list of all customers and there must be "0" record with below details
      | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber |
      | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR000000000000001 |
    And user can get list of all customers and there must be "1" record with below details
      | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber |
      | Jane      | William      | jane@william.com | +3161234567 | 01-FEB-2010 | IR000000000000002 |
    When user delete customer by Email of "new@email.com"
    Then user can get all records and get "0" records
