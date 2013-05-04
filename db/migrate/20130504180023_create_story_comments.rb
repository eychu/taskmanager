class CreateStoryComments < ActiveRecord::Migration
  def change
    create_table :story_comments do |t|
      t.references :user
      t.references :story
      t.text :text

      t.timestamps
    end
    add_index :story_comments, :user_id
    add_index :story_comments, :story_id
  end
end
