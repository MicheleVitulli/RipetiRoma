class AddReviewedIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :reviewed_id, :integer
    add_index :reviews, :reviewed_id
  end
end
