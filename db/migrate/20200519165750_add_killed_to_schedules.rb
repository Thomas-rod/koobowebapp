class AddKilledToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :killed, :boolean, default: false
  end
end
