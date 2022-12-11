Feature: Customer Management
  Scenario: Create a customer with correct entry
    WHEN user fills and submit the form with:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com   | +989127606447   | IR110570033780012625008101   | 
    THEN 1 customer with these details is created:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com   | +989127606447   | IR110570033780012625008101   |      

  Scenario: Create a customer with same email is not allowed
    GIVEN create a customer with these details:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 |  
    WHEN user fills and submit the form with: firstName:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | Ali      | Alavi  | July 17, 1999 | mdm1369@gmail.com | +989127606448 | IR110570033780012635008101 |  
    THEN 0 customer with these details is created:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | Ali      | Alavi  | July 17, 1999 | mdm1369@gmail.com | +989127606448 | IR110570033780012635008101 |  

  Scenario: Create a customer with same name and lastName and birthDate is not allowed
    GIVEN create a customer with these details: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 |  
    WHEN user fills and submit the form with: 
      | firstName | lastName  | birthDate     | email           | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm@gmail.com | +989137606447 | IR110670033780012625008101 | 
    THEN 0 customer with these details is created:
      | firstName | lastName  | birthDate     | email           | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm@gmail.com | +989137606447 | IR110670033780012625008101 | 

  Scenario: Create a customer with wrong email format is not allowed
    WHEN user fills and submit the form with: 
      | firstName | lastName  | birthDate     | email             | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369mail.com | +989137606447 | IR110670033780012625008101 | 
    THEN 0 customer with these details is created: 
      | firstName | lastName  | birthDate     | email             | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369mail.com | +989137606447 | IR110670033780012625008101 | 

  Scenario: Create a customer with wrong MobileNumber format is not allowed
    WHEN user fills and submit the form with: 
      | firstName | lastName  | birthDate     | email             | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +982122532774 | IR110670033780012625008101 |
    THEN 0 customer with these details is created:
      | firstName | lastName  | birthDate     | email             | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +982122532774 | IR110670033780012625008101 |
  Scenario: Create a customer with wrong bankAccountNumber format is not allowed
    WHEN user fills and submit the form with: 
      | firstName | lastName  | birthDate     | email             | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +989137606447 | IR110                      |
    THEN 0 customer with these details is created:
      | firstName | lastName  | birthDate     | email             | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +989137606447 | IR110                      |

  Scenario: Create a customer with an empty field is not allowed-all fields required
    WHEN user fills and submit the form with:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | [blank]        | dehghan | July 16, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 | 
    THEN 0 customer with these details is created:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | [blank]        | dehghan | July 16, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 |
    

  Scenario: Read a customer details
    GIVEN create a customer with these details: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 |
    WHEN user request get a customer with these details: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 |
    THEN customer with these details loaded: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 |

  Scenario: Read all customers 
    GIVEN create a customer with these details: 
      | firstName | lastName  | birthDate     | email             | phoneNumber     | bankAccountNumber            | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com | +989127606447   | IR110570033780012625008101   |
    WHEN user request get all customers
    THEN customers list loaded with:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 | 

  Scenario: Read empty customers list
    WHEN user request get all customers
    THEN there is no customer in list 
      

  Scenario: Update a customer with correct entries
    GIVEN create a customer with these details: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 |
    WHEN user updates a first customer to these details:
      | firstName | lastName   | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghani | July 17, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 | 
    THEN there is 0 customer with these details:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghan | July 16, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 |
    BUT there is 1 customer with these details:
      | firstName | lastName   | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood | dehghani | July 17, 1990 | mdm1369@gmail.com | +989127606447 | IR110570033780012625008101 | 

  Scenario: Update a customer with same email is not allowed
    GIVEN create a customer with these details: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com   | +989127606447   | IR110570033780012625008101   |
    AND create a customer with these details: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | Ali       | Alavi     | July 18, 1990 | mdm@gmail.com     | +989127606447 | IR110570033780012625008101 |
    WHEN user updates a first customer to these details: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood   | dehghan   | July 16, 1990 | mdm@gmail.com       | +989127606447   | IR110570033780012625008101   |
    THEN there is 0 customer with these details:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood   | dehghan   | July 16, 1990 | mdm@gmail.com       | +989127606447   | IR110570033780012625008101   |
    BUT there is 1 customer with these details:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com   | +989127606447   | IR110570033780012625008101   |

  Scenario: Update a customer with same name and lastName and birthDate is not allowed
    GIVEN create a customer with these details: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com   | +989127606447   | IR110570033780012625008101   |
    AND create a customer with these details: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | Ali       | Alavi     | July 18, 1990 | mdm@gmail.com       | +989127606441   | IR110570033780012625008101   |
    WHEN user updates a first customer to these details: 
      | firstName | lastName  | birthDate     | email                   | phoneNumber     | bankAccountNumber            | 
      | Ali       | Alavi     | July 18, 1990 | mdm1234@gmail.com       | +989157606440   | IR110570033780012625008101   |
    THEN there is 0 customer with these details:
      | firstName | lastName  | birthDate     | email                   | phoneNumber     | bankAccountNumber            | 
      | Ali       | Alavi     | July 18, 1990 | mdm1234@gmail.com       | +989157606440   | IR110570033780012625008101   |
    BUT there is 1 customer with these details:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com   | +989127606447   | IR110570033780012625008101   |
   

  Scenario: Delete a customer 
    GIVEN create a customer with these details: 
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber          | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com   | +989127606447   | IR110570033780012625008101 |
    WHEN user delete a customer with these details:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber          | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com   | +989127606447   | IR110570033780012625008101 |
    THEN there is 0 customer with these details:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber          | 
      | mahmood   | dehghan   | July 16, 1990 | mdm1369@gmail.com   | +989127606447   | IR110570033780012625008101 |