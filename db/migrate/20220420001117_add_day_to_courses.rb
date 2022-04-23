class AddDayToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :day, :string
  end
end
