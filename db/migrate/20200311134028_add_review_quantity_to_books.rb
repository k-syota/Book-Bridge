class AddReviewQuantityToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :review_quantity, :integer
  end
end
