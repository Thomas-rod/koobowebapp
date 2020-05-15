class AddBookedToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :booked, :boolean, default: false
  end
end

