# frozen_string_literal: true

class AddMessangerIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :messanger_id, :integer
    add_index :messages, :messanger_id
  end
end
