class RemoveBookIdFromAuthors < ActiveRecord::Migration[5.2]
  def change
    remove_column :authors, :book_id, :integer
  end
end
