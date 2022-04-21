# frozen_string_literal: true

class AddSubjectToCourses < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :subject, null: false, foreign_key: true
  end
end
