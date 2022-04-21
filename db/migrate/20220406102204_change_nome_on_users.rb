# frozen_string_literal: true

class ChangeNomeOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :nome, false
  end
end
