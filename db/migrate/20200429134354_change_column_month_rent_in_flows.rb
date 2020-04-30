class ChangeColumnMonthRentInFlows < ActiveRecord::Migration[6.0]
  def change
    remove_column :flows, :month_rent
    add_column :flows, :month_rent, :date
  end
end
