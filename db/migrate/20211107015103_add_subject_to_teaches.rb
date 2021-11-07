class AddSubjectToTeaches < ActiveRecord::Migration[6.1]
  def change
    add_reference :teaches, :subject, null: false, foreign_key: true
  end
end
