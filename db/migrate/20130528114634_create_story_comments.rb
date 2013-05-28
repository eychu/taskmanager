class CreateStoryComments < ActiveRecord::Migration
  def change
    create_table :story_comments do |t|
      t.references :story
      t.references :user
      t.text :text

      t.timestamps
    end
    add_index :story_comments, :user_id
  end
end
