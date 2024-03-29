# frozen_string_literal: true

class AddTeacherIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :teacher_id, :integer
    add_index :courses, :teacher_id
  end
end
