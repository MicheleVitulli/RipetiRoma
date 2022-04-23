Feature: Admin can manage subjects, 

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
    Then I should see 'Destroy'
    When I follow 'Destroy'
    Then I should be on 'subjects' index path
    Then I should not see "Latino"


