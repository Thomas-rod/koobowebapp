module RentingHelper

  def renter_informations_number?(renting)
    counter = 0
    counter += 1 if !renting.type_renter.nil?
    counter += 1 if !renting.renter.nil?
    counter += 1 if !renting.renter_address.nil?
    counter == 3 ? true : false
  end

  def renter_informations_number(renting)
    counter = 0
    counter += 1 if !renting.type_renter.nil?
    counter += 1 if !renting.renter.nil?
    counter += 1 if !renting.renter_address.nil?
    return counter
  end
end
