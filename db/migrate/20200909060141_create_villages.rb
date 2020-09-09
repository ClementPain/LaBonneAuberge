class CreateVillages < ActiveRecord::Migration[5.2]
  def change
    create_table :villages do |t|
      t.string :name
      t.string :zipcode
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
