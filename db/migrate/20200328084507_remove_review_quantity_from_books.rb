class RemoveReviewQuantityFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :review_quantity, :integer
  end
end
