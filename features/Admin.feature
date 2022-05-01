Feature: Admin features 

Scenario: Add a subject
  Given I am Admin
  Given I am on home page
  When I follow "Materie"
  Then I should be on 'subjects' index path
  When I follow "Nuova materia"
  Then I should be on 'subjects' new path
  When I fill in "subject_name" with "Latino"
  Then I press "Aggiungi"
  Then I should see "Latino"

Scenario: Delete a subject
    #adding
    Given I am Admin
    Given I am on home page
    When I follow "Materie"
    Then I should be on 'subjects' index path
    When I follow "Nuova materia"
    Then I should be on 'subjects' new path
    When I fill in "subject_name" with "Latino"
    Then I press "Aggiungi"
    Then I should see "Latino"
    #deliting
    Given I am on 'subjects' index path
    Then I should see 'Elimina'
    When I follow 'Elimina'
    Then I should be on 'subjects' index path
    Then I should not see "Latino"

Scenario: Deleting an user account
  Given I am Admin
  Given a random 'Roberto' Teacher
  Given I am on home page
  Then I follow "Elenco insegnanti e studenti"
  Then I should be on 'users' index path
  When I follow 'Roberto'
  Then I should see "Elimina account di questo utente"
  When I follow "Elimina account di questo utente"
  Then I should be on homepage
  When I follow "Elenco insegnanti e studenti"
  Then I should not see "Roberto"
  And "Roberto" in not an user

Scenario: I can see all users
  Given I am Admin
  Given a random 'Roberto' Teacher
  Given a random 'Domenico' Student
  Given I am on home page
  Then I follow "Elenco insegnanti e studenti"
  Then I should see 'Roberto'
  And I should see 'Domenico'

Scenario: I can see all courses
  Given I am Admin
  Given a random 'Roberto' Teacher that teaches "Latino"
  Given a random 'Domenico' Student
  Given a random course of 'Roberto' to 'Domenico' in 'Latino'
  Given a random 'Giovanni' Teacher that teaches "Storia"
  Given a random 'Luisa' Student
  Given a random course of 'Giovanni' to 'Luisa' in 'Storia'
  Given I am on home page
  Then I should see "Corsi"
  When I follow "Corsi"
  Then I should see "Roberto"
  Then I should see "Domenico"
  Then I should see "Latino"
  Then I should see "Giovanni"
  Then I should see "Luisa"
  Then I should see "Storia"


