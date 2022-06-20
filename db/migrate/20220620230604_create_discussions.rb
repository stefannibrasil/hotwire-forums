class CreateDiscussions < ActiveRecord::Migration[7.0]
  def change
    create_table :discussions do |t|
      t.string :name
      t.boolean :pinned, default: false
      t.boolean :closed, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
