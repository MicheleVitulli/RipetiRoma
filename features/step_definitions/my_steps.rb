# frozen_string_literal: true

##################### Given commands
Given('I am Admin') do
  user = User.create!(email: 'michele.vitulli@outlook.it', password: 'michele', nome: 'Michele')
  user.add_role :admin
  visit '/users/sign_in'
  fill_in 'Email',	with: 'michele.vitulli@outlook.it'
  fill_in 'Password',	with: 'michele'

  click_button 'Entra'

  expect(page).to have_text('Admin')
end
Given('I am Teacher {string}') do |string|
  user = User.create!(email: 'insegnante@zero.it', password: 'insegnante', nome: string, ruolo: 'Insegnante',
                      descrizione: 'Ciao sono Roberto')
  user.add_role :teacher
  visit '/users/sign_in'
  fill_in 'Email',	with: 'insegnante@zero.it'
  fill_in 'Password',	with: 'insegnante'
  click_button 'Entra'
  expect(page).to have_text('Insegnante')
end
Given('I am Student') do
  user = User.create!(email: 'studente@uno.it', password: 'studente', nome: 'Domenico', ruolo: 'Studente')
  user.add_role :student
  visit '/users/sign_in'
  fill_in 'Email',	with: 'studente@uno.it'
  fill_in 'Password',	with: 'studente'
  click_button 'Entra'
  expect(page).to have_text('Studente')
end

Given('a random {string} Teacher') do |string|
  user = User.create!(email: "#{string}@.it", password: 'insegnante', nome: string,
                      ruolo: 'Insegnante', descrizione: 'Ciao sono Roberto')
  user.add_role :teacher
end
Given('I am Teacher {string} that teaches {string}') do |string, string2|
  user = User.create!(email: 'insegnante@zero.it', password: 'insegnante', nome: string, ruolo: 'Insegnante',
                      descrizione: 'Ciao sono Roberto')
  subj = Subject.create(name: string2)
  user.add_role :teacher
  user.subjects.push(subj)
  visit '/users/sign_in'
  fill_in 'Email',	with: 'insegnante@zero.it'
  fill_in 'Password',	with: 'insegnante'
  click_button 'Entra'
  expect(page).to have_text('Insegnante')
end
Given('a random {string} Student') do |string|
  user = User.create!(email: "#{string}@due.it", password: 'studente', nome: string,
                      ruolo: 'Studente')
  user.add_role :teacher
end
Given('a random {string} Teacher with {string} CAP') do |string, string2|
  user = User.create!(email: 'insegnante@uno.it', password: 'insegnante', nome: string,
                      ruolo: 'Insegnante', descrizione: 'Ciao sono Roberto')
  user.add_role :teacher
  user.postals.push(string2)
end
Given('a random {string} Teacher that teaches {string}') do |string, string2|
  user = User.create!(email: "#{string}@uno.it", password: 'insegnante', nome: string,
                      ruolo: 'Insegnante', descrizione: 'Ciao sono Roberto')
  subj = Subject.create(name: string2)
  user.add_role :teacher
  user.subjects.push(subj)
end
Given('a random course of {string} to {string} in {string}') do |string, string2, string3|
  teacher = User.find_by_nome(string)
  student = User.find_by_nome(string2)
  subj = Subject.find_by_name(string3)
  course = Course.create(teacher: teacher, student: student, subject: subj)
  res = teacher.students.include? student
  expect(res).to eq(true)
end

Given('I am on home page') do
  visit '/'
end
Given('I am on {string} index path') do |string|
  visit "/#{string}"
end

################# When commands
When('I follow {string}') do |string|
  click_link(string)
end
When('I fill in {string} with {string}') do |string, string2|
  fill_in(string, with: string2)
end

When('I select in {string} with {string}') do |string, string2|
  select string2, from: string
end

################## Then commands
Then('I should see {string}') do |string|
  # save_and_open_page
  expect(page).to have_text(string)
end
Then('I should see {string} button') do |string|
  expect(page).to have_button(string)
end
Then('I should not see {string}') do |string|
  expect(page).not_to have_text(string)
end

Then('I should be on homepage') do
  current_path = URI.parse(current_url).path
  expect(current_path).to eq('/')
end

Then('I should be on {string} index path') do |string|
  current_path = URI.parse(current_url).path
  ris = false
  ris = true if current_path == "/#{string}"
  if current_path = "/#{string}/index"
    ris = true
  end
  expect(ris).to eq(true)
end
Then('I should be on {string} new path') do |string|
  current_path = URI.parse(current_url).path
  expect(current_path).to eq("/#{string}/new")
end
Then('I press {string}') do |string|
  click_button(string)
end
Then('I should be on {string} {string} show path') do |string, string2|
  @insegnante = User.find_by_nome(string)
  current_path = URI.parse(current_url).path
  expect(current_path).to eq("/#{string2}/#{@insegnante.id}")
end

Then('I should see {string} description') do |string|
  @description = User.find_by_nome(string).descrizione
  # doppio controllo in caso di description = nil
  expect(page).to have_text(@description) and expect(page).to have_text('Ciao sono Roberto')
end
Then('I expect {string} to have a {string} message') do |string, string2|
  @insegnante = User.find_by_nome(string)
  mess = Message.find_by_testo(string2)
  ris = @insegnante.messages.include? mess
  # log di prova sul controllo del messaggio inviato
  expect(ris).to eq(true)
end
Then('I am no longer a user') do
  ris = User.find_by_nome('Roberto')
  expect(ris).to eq(nil)
end

Then('{string} email is {string}') do |string, string2|
  @user = User.find_by_nome(string)
  expect(@user.email).to eq(string2)
end

Then('{string} should have a new course with {string} of {string}') do |string, string2, string3|
  io = User.find_by_nome(string)
  corso = Course.find_by_teacher_id(io)
  student = User.find_by_nome(string2)
  subj = Subject.find_by_name(string3)
  res = io.students.include? student
  res = false if corso.subject != subj
  expect(res).to eq(true)
end

Then('{string} should not have a course with {string} of {string}') do |string, string2, _string3|
  io = User.find_by_nome(string)
  corso = Course.find_by_teacher_id(io)
  student = User.find_by_nome(string2)
  res = io.students.include? student
  expect(res).to eq(false)
end

Then('{string} in not an user') do |string|
  ris = User.find_by_nome(string)
  expect(ris).to eq(nil)
end
