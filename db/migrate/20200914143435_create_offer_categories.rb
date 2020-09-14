class CreateOfferCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_categories do |t|

      t.timestamps
    end
  end
end
