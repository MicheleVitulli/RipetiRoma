# Given commands
Given('I am Admin') do
  user = User.create!(email: 'michele.vitulli@outlook.it', password: 'michele', nome: 'Michele')
  user.add_role :admin
  visit '/users/sign_in'
  fill_in 'Email',	with: 'michele.vitulli@outlook.it'
  fill_in 'Password',	with: 'michele'
  click_button 'Entra'
  expect(page).to have_text('Admin')
end
Given('I am Teacher') do
  user = User.create!(email: 'insegnante@uno.it', password: 'insegnante', nome: 'Roberto',
                      descrizione: 'Ciao sono Roberto')
  user.add_role :teacher
  visit '/users/sign_in'
  fill_in 'Email',	with: 'insegnante@uno.it'
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
  user = User.create!(email: 'insegnante@uno.it', password: 'insegnante', nome: string,
                      ruolo: 'Insegnante', descrizione: 'Ciao sono Roberto')
  user.add_role :teacher
end
Given('I am on home page') do
  visit '/'
end
Given('I am on {string} index path') do |string|
  visit '/' + string
end

# When commands
When('I follow {string}') do |string|
  click_link(string) # Write code here that turns the phrase above into concrete actions
end
When('I fill in {string} with {string}') do |string, string2|
  fill_in(string, with: string2)
  # save_and_open_page

  # pending # Write code here that turns the phrase above into concrete actions
end

When('I select in {string} with {string}') do |string, string2|
  select string2, from: string # Write code here that turns the phrase above into concrete actions
end

# When('I press {string}') do |string|
#    click_button(string)
# end

# Then commands
Then('I should see {string}') do |string|
  # save_and_open_page
  expect(page).to have_text(string) # Write code here that turns the phrase above into concrete actions
end
Then('I should not see {string}') do |string|
  expect(page).not_to have_text(string) # Write code here that turns the phrase above into concrete actions
end

Then('I should be on homepage') do
  current_path = URI.parse(current_url).path
  current_path == '/'
end

Then('I should be on {string} index path') do |string|
  current_path = URI.parse(current_url).path
  current_path == '/' + string
end
Then('I should be on {string} new path') do |string|
  current_path = URI.parse(current_url).path
  current_path == '/' + string + '/new'
end
Then('I press {string}') do |string|
  click_button(string)
end
Then('I should be on {string} {string} show path') do |string, string2|
  @insegnante = User.find_by_nome(string)
  current_path = URI.parse(current_url).path
  current_path == '/' + string2 + '/' + @insegnante.id.to_s
end

Then('I should see {string} description') do |string|
  @description = User.find_by_nome(string).descrizione
  # doppio controllo in caso di description = nil
  expect(page).to have_text(@description) and expect(page).to have_text('Ciao sono Roberto')
end
Then('I expect {string} to have a {string} message') do |string, string2|
  @insegnante = User.find_by_nome(string)
  @insegnante.messages.include? string2
  # log di prova sul controllo del messaggio inviato
  log(@insegnante.messages[0].testo)
end
Then('I am no longer a user') do
  !User.find_by_nome('Roberto') # Write code here that turns the phrase above into concrete actions
end

Then('{string} email is {string}') do |string, string2|
  @user = User.find_by_nome(string)
  @user.email == string2
end
