Feature: Student can see Teacher profile and leave/delete a review, send messages, editing and destroy my account


Scenario: View teacher profile
    Given I am Student
     Given a random 'Roberto' Teacher
    When I follow 'Insegnanti'
    Then I should see 'Roberto'
    When I follow 'Roberto'
    Then I should be on 'Roberto' 'users' show path
    And I should see 'Roberto' description

Scenario: Writing a review
    Given I am Student
     Given a random 'Roberto' Teacher
    When I follow 'Insegnanti'
    Then I should see 'Roberto'
    When I follow 'Roberto'
    Then I should be on 'Roberto' 'users' show path
    And I should see 'Roberto' description
    And I should see 'Scrivi la tua recensione'
    When I fill in "review_testo" with "Ottimo insegnante"
    And I select in "review_valutazione" with "3"
    When I press 'Pubblica recensione'
    Then I should see 'Ottimo insegnante'
    And I should see 'Elimina recensione'

Scenario: Deleting a review
    Given I am Student
     Given a random 'Roberto' Teacher
    When I follow 'Insegnanti'
    When I follow 'Roberto'
    When I fill in "review_testo" with "Ottimo insegnante"
    And I select in "review_valutazione" with "3"
    When I press 'Pubblica recensione'
    Then I should see 'Elimina recensione'
    When I follow 'Elimina recensione'
    Then I should not see 'Ottimo insegnante'


Scenario: Sending a message
    Given I am Student
    Given a random 'Roberto' Teacher
    When I follow 'Insegnanti'
    When I follow 'Roberto'
    Then I should see 'Manda un messaggio'
    When I fill in "message_testo" with "Ciao, come stai?"
    When I press 'Invia messaggio'
    Then I expect 'Roberto' to have a "Ciao, come stai?" message

Scenario: Destroy Account
    Given I am Student
    Then I should see "Il tuo profilo"
    When I follow "Il tuo profilo"
    Then I should see "Modifica il tuo profilo"
    When I follow "Modifica il tuo profilo"
    Then I should see "Elimina"
    When I follow "Elimina"
    Then I am no longer a user
    And I should be on homepage

Scenario: Changing email
    Given I am Student
    When I follow "Il tuo profilo"
    When I follow "Modifica il tuo profilo"
    Then I should see "Modifica il tuo account"
    When I fill in "user_email" with "nuova@email.it"
    And I press "Conferma"
    Then I should be on 'Domenico' 'users' show path
    And 'Domenico' email is "nuova@email.it"

