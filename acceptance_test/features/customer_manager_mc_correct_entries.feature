Feature: Create Read Edit Delete Customer

  Background:
    Given system error codes are following
      | Code | Description                                                |
      | 101  | Invalid Mobile Number                                      |
      | 102  | Invalid Email address                                      |
      | 103  | Invalid Bank Account Number                                |
      | 201  | Duplicate customer by First-name, Last-name, Date-of-Birth |
      | 202  | Duplicate customer by Email address                        |

  Scenario: Create Read Edit Delete Customer
    GIVEN I wait until the "plus" is present
    WHEN user creates a customer with following data by clicking submit and typing below data
      | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber          |
      | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR110570033780012625008101 |
    Then user can get list of all customers and there must be "1" record with below details
      | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber          |
      | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR110570033780012625008101 |  
    When user edit customer with new data
      | FirstName | LastName     | Email            | PhoneNumber   | DateOfBirth | BankAccountNumber |
      | Jane      | William      | jane@william.com | +989121234557 | 01-FEB-2001 | IR110570033780012625008101 |
    Then user can get list of all customers and there must be "0" record with below details
      | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber |
      | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR110570033780012625008101 |
    And user can get list of all customers and there must be "1" record with below details
      | FirstName | LastName | Email            | PhoneNumber   | DateOfBirth | BankAccountNumber          |
      | Jane      | William  | jane@william.com | +989121234557 | 01-FEB-2001 | IR110570033780012625008101 |
    When user delete customer by Email of "jane@william.com" 
    Then user can get all records and get "0" records       