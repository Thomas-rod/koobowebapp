class CreateFlows < ActiveRecord::Migration[6.0]
  def change
    create_table :flows do |t|
      t.references :renting, null: false, foreign_key: true
      t.datetime :payment_date
      t.date :month_rent
      t.float :amount
      t.string :type

      t.timestamps
    end
  end
end
