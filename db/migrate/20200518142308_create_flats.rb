class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :address
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
