Feature: Pick Birth Date

  Scenario: Show Date Picker 
    GIVEN I expect the "changeDate" to be present
    WHEN I tap the "changeDate" button
    THEN I expect the text "Done" to be present

  Scenario: Pick Date of Birth
    GIVEN I tap the "changeDate" button
    WHEN I choose a before last year 
    THEN I expect the "birthDateField" to be right date

  Scenario: age under 18 is not valid
    GIVEN I expect the "changeDate" to be present
    WHEN I tap the "changeDate" button 
    THEN I can't select the age before eighteen   