class AddColumnsToRenting < ActiveRecord::Migration[6.0]
  def change
    add_column :rentings, :type_renter, :string
    add_column :rentings, :renter, :string
    add_column :rentings, :renter_address, :string
  end
end
