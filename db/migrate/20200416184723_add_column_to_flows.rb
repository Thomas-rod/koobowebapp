class AddColumnToFlows < ActiveRecord::Migration[6.0]
  def change
    add_column :flows, :title, :string
  end
end
