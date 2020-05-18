class AddColumnsToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :first_name, :string
    add_column :records, :last_name, :string
    add_column :records, :email, :string
  end
end
