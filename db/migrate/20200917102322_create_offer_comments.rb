class CreateOfferComments < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_comments do |t|
      t.text :content
      t.belongs_to :offer, index:true
      t.belongs_to :villager, index:true

      t.timestamps
    end
  end
end
