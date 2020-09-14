class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :type_of_offer
      t.text :description

      t.belongs_to :village, index: true

      t.timestamps
    end
  end
end
