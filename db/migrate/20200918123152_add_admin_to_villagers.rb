class AddAdminToVillagers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :villagers, :is_admin?, :boolean
  end

  def self.down
    remove_column :villagers, :is_admin?, :boolean
  end
end
