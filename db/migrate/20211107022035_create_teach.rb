# frozen_string_literal: true

class CreateTeach < ActiveRecord::Migration[6.1]
  def change
    create_table :teaches do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
