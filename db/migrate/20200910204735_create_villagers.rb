class CreateVillagers < ActiveRecord::Migration[5.2]
  def change
    create_table :villagers do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.datetime :date_of_birth
      t.belongs_to :village
      t.string :address
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
