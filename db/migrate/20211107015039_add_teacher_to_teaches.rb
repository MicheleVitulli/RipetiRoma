class AddTeacherToTeaches < ActiveRecord::Migration[6.1]
  def change
    add_reference :teaches, :teacher, null: false, foreign_key: true
  end
end
