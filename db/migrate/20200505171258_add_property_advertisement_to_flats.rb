class AddPropertyAdvertisementToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :property_advertisement, :text, default: ""
  end
end
