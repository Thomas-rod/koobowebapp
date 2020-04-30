class ChangeColumnAndAddColumnToFlows < ActiveRecord::Migration[6.0]
  def change
    remove_column :flows, :month_rent
    add_column :flows, :month_rent, :integer
    add_column :flows, :year_rent, :integer
  end
end
