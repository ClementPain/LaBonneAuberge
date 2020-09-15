class CreateForumPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_posts do |t|
      t.string :content
      t.belongs_to :villager, foreign_key: true
      t.belongs_to :forum, foreign_key: true

      t.timestamps
    end
  end
end
