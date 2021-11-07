class RemoveTeacherFromSubjects < ActiveRecord::Migration[6.1]
  def change
    remove_reference :subjects, :teacher, null: false, foreign_key: true
  end
end
