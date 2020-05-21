class CreateBackers < ActiveRecord::Migration[6.0]
  def change
    create_table :backers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.float :revenue
      t.references :record

      t.timestamps
    end
  end
end
