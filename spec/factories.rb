# frozen_string_literal: true

FactoryBot.define do
  factory(:user) do
    email { 'prova@uno.it' }
    password { 'password' }
    nome { 'Michele' }
  end
  factory(:course) do
  end
  factory(:review) do
    testo {"recensione di prova"}
    valutazione {3}
  end
  factory(:message) do
    testo {"messaggio di prova"}
  end
end
