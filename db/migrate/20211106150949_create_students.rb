class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
