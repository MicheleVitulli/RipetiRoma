# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :valutazione
      t.text :testo

      t.timestamps
    end
  end
end
