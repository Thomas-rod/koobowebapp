class AddPropertyAdvertisementToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :property_advertisement, :text, default: ""
  end

  # IT'S THE FLAT'S REFERENCE WHICH WILL BE USED WHEN WE PUBLISHED TO TELL PEOPLE WHERE TO LOOK
end
