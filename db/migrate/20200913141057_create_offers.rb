class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.belongs_to :category

      t.belongs_to :village, index: true

      t.timestamps
    end
  end
end
