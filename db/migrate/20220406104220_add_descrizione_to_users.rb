class AddDescrizioneToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :descrizione, :text
  end
end
