class CreateValidationTownHalls < ActiveRecord::Migration[5.2]
  def change
    create_table :validation_town_halls do |t|
      t.belongs_to :villager, foreign_key: true
      t.belongs_to :village, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
