class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :address
      t.text :description
      t.float :monthly_price
      t.references :user, null: false, foreign_key: true
      t.boolean :visible
      t.boolean :rented

      t.timestamps
    end
  end
end
