# frozen_string_literal: true

class RemovePostalsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :postals, :string
  end
end
