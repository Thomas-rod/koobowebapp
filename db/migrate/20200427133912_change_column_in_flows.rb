class ChangeColumnInFlows < ActiveRecord::Migration[6.0]
  def change
    remove_column :flows, :month_rent
    add_column :flows, :month_rent, :integer
  end
end
