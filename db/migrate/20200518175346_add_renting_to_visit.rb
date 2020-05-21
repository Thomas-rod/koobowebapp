class AddRentingToVisit < ActiveRecord::Migration[6.0]
  def change
    add_column :visits, :renting, :boolean, default: ""
  end
end
