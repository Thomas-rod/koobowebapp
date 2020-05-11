class AddColumnToVisits < ActiveRecord::Migration[6.0]
  def change
    add_column :visits, :people, :integer
    add_column :visits, :income, :float
    add_column :visits, :contract, :string
    add_column :visits, :phone, :string
  end
end
