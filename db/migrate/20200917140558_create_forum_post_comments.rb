class CreateForumPostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_post_comments do |t|
      t.text :content
      t.belongs_to :villager
      t.belongs_to :forum_post
      
      t.timestamps
    end
  end
end
