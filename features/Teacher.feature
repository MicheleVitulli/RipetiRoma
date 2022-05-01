Feature: Teacher features

Scenario: View My Profile
    Given I am Teacher 'Michele'
    Then I should see 'Il tuo profilo'
    When I follow 'Il tuo profilo'
    Then I should see 'Michele'

Scenario: I cannot leave a reviews
    Given I am Teacher 'Michele'
    Given a random 'Roberto' Teacher
    When I follow 'Insegnanti'
    When I follow 'Roberto'
    Then I should not see 'Scrivi la tua recensione'

Scenario: Sending a message
    Given I am Teacher 'Michele'
    Given a random 'Domenico' Teacher
    When I follow 'Insegnanti'
    When I follow 'Domenico'
    Then I should see 'Manda un messaggio'
    When I fill in "message_testo" with "Ciao, come stai?"
    When I press 'Invia messaggio'
    Then I expect 'Domenico' to have a "Ciao, come stai?" message

Scenario: I can start a new course with a student 
    Given I am Teacher 'Michele' that teaches 'Latino'
    Given a random 'Domenico' Student
    When I follow 'I tuoi corsi'
    Then I should be on 'courses' index path
    When I follow 'Nuovo Corso'
    And I fill in "search" with "domenico@due.it"
    And I press "Cerca"
    Then I should see 'Inizia un corso'
    When I follow 'Inizia un corso'
    Then I should see "Seleziona la materia del nuovo corso"
    And I should see 'Latino'
    When I follow 'Latino'
    Then 'Michele' should have a new course with 'Domenico' of 'Latino'

Scenario: I can delete one of my courses
    Given I am Teacher 'Michele' that teaches 'Latino'
    Given a random 'Domenico' Student
    When I follow 'I tuoi corsi'
    When I follow 'Nuovo Corso'
    And I fill in "search" with "domenico@due.it"
    And I press "Cerca"
    When I follow 'Inizia un corso'
    When I follow 'Latino'
    Then 'Michele' should have a new course with 'Domenico' of 'Latino'
    And I should be on 'courses' index path
    Then I should see "Elimina"
    When I follow "Elimina"
    Then I should not see 'Domenico'
    And 'Michele' should not have a course with 'Domenico' of 'Latino'

