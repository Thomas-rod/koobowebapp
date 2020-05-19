class AddStartRentingDateToFlat < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :start_renting_date, :date, default: Time.new
  end
end
