Feature: Customer Management
  Scenario: Create a customer with correct entry
    WHEN user fills and submit the form with:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | "mahmood" | "dehghan" | July 16, 1990 | "mdm1369@gmail.com" | "+989127606447" | "IR110570033780012625008101" | 
    THEN 1 user with these details is created:
      | firstName | lastName  | birthDate     | email               | phoneNumber     | bankAccountNumber            | 
      | "mahmood" | "dehghan" | July 16, 1990 | "mdm1369@gmail.com" | "+989127606447" | "IR110570033780012625008101" |      

  Scenario: Create a customer with same email is not allowed
    GIVEN create 1 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |   
    WHEN fills and submit the form with| firstName:"Ali" | lastName:"Alavi" | birthDate:July 17, 1999 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606448" | bankAccountNumber:"IR110570033780012725008101" | 
    THEN 0 user with these details | firstName:"Ali" | lastName:"Alavi" | birthDate:July 17, 1999 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606448" | bankAccountNumber:"IR110570033780012725008101" | is created

  Scenario: Create a customer with same name and lastName and birthDate is not allowed
    GIVEN create 1 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |  
    WHEN fills and submit the form with| firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm@gmail.com" | phoneNumber:"+989127606449" | bankAccountNumber:"IR110570033780012725008101" | 
    THEN 0 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm@gmail.com" | phoneNumber:"+989127606449" | bankAccountNumber:"IR110570033780012725008101" | is created

  Scenario: Create a customer with wrong email format is not allowed
    WHEN user fills and submit the form with| firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369mail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" | 
    THEN 0 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" | is created

  Scenario: Create a customer with wrong MobileNumber format is not allowed
    WHEN user fills and submit the form with| firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369mail.com" | phoneNumber:"+982122532774" | bankAccountNumber:"IR110570033780012625008101" | 
    THEN 0 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+982122532774" | bankAccountNumber:"IR110570033780012625008101" | is created

  Scenario: Create a customer with wrong bankAccountNumber format is not allowed
    WHEN user fills and submit the form with| firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369mail.com" | phoneNumber:"+982122532774" | bankAccountNumber:"IR110" | 
    THEN 0 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+982122532774" | bankAccountNumber:"IR110" | is created

  Scenario: Create a customer with an empty field is not allowed-all fields required
    WHEN user fills and submit the form with| firstName:"" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369mail.com" | phoneNumber:"+982122532774" | bankAccountNumber:"IR110" | 
    THEN 0 user with these details | firstName:"" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+982122532774" | bankAccountNumber:"IR110" | is created

  Scenario: Read a customer details
    GIVEN create 1 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
    WHEN user select a customer with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
    THEN user sees 1 customer details with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" | on screen

  Scenario: Read all customers 
    WHEN create 1 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
    THEN 1 customer with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" | loads

  Scenario: Read empty customers list
    WHEN app starts for first time
    THEN 0 customer loads

  Scenario: Update a customer with correct entries
   GIVEN create 1 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
   WHEN user updates a first customer with these details | firstName:"mahmood" | lastName:"dehghani" | birthDate:July 17, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
   THEN there is 1 user with these details | firstName:"mahmood" | lastName:"dehghani" | birthDate:July 17, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" | 

  Scenario: Update a customer with same email is not allowed
   GIVEN create 1 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
   AND create 1 user with these details | firstName:"Ali" | lastName:"Alavi" | birthDate:July 18, 1990 | email:"mdm@gmail.com" | phoneNumber:"+989127606441" | bankAccountNumber:"IR110570033780012645008101" |
   WHEN user updates a first customer with these details | firstName:"mahmood" | lastName:"dehghani" | birthDate:July 17, 1990 | email:"mdm@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
   THEN there is 0 user with these details | firstName:"mahmood" | lastName:"dehghani" | birthDate:July 17, 1990 | email:"mdm@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |

  Scenario: Update a customer with same name and lastName and birthDate is not allowed
   GIVEN create 1 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
   AND create 1 user with these details | firstName:"Ali" | lastName:"Alavi" | birthDate:July 18, 1990 | email:"mdm@gmail.com" | phoneNumber:"+989127606441" | bankAccountNumber:"IR110570033780012645008101" |
   WHEN user updates a first customer with these details | firstName:"Ali" | lastName:"Alavi" | birthDate:July 18, 1990 | email:"mdm@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
   THEN there is 0 user with these details | firstName:"Ali" | lastName:"Alavi" | birthDate:July 18, 1990 | email:"mdm@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |


  Scenario: Delete a customer 
    GIVEN create 1 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
    WHEN user delete a customer with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |
    THEN there is 0 user with these details | firstName:"mahmood" | lastName:"dehghan" | birthDate:July 16, 1990 | email:"mdm1369@gmail.com" | phoneNumber:"+989127606447" | bankAccountNumber:"IR110570033780012625008101" |