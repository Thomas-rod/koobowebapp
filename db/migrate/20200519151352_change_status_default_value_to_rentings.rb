class ChangeStatusDefaultValueToRentings < ActiveRecord::Migration[6.0]
  def change
    change_column :rentings, :status, :string, default: 'ongoing'
  end
end
