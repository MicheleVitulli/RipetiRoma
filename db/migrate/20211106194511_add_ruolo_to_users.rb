class AddRuoloToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ruolo, :string
  end
end
