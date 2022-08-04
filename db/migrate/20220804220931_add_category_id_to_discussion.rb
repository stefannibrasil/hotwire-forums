class AddCategoryIdToDiscussion < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :category_id, :integer
  end
end
