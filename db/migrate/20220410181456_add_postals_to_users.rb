# frozen_string_literal: true

class AddPostalsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postals, :string
  end
end
