class AddPhoneNumberToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :phone_number, :string, default: ""
  end
end
