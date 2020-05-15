class AddMessageToVisits < ActiveRecord::Migration[6.0]
  def change
    add_column :visits, :message, :text, default: ""
  end
end
