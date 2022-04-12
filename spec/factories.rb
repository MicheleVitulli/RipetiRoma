FactoryBot.define do
  factory(:user) do
    email { 'prova@uno.it' }
    password { 'password' }
    nome { 'Michele' }
  end
  factory(:course) do
  end
end
