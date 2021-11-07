class ChangeNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :courses, :subject_id, true
  end
end
