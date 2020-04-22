class AddStatusToRentings < ActiveRecord::Migration[6.0]
  def change
    add_column :rentings, :status, :string, default: "current"
    add_column :rentings, :end_date, :date, default: nil
  end
end
