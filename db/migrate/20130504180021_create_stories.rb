class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :user
      t.string :title
      t.text :description
      t.string :state
      t.integer :assign_to_user_id

      t.timestamps
    end
    add_index :stories, :user_id
  end
end
