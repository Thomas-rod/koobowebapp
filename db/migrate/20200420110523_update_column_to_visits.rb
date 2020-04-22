class UpdateColumnToVisits < ActiveRecord::Migration[6.0]
  def change
    change_column :visits, :status, :string, default: 'pending'
  end
end
