module SearchHelper

  def available_schedule(flat)
    counter = 0
    schedule_number = flat.schedules.count
    flat.schedules.each do |schedule|
      schedule_visits =  schedule.visits
      unless schedule_visits.select{ |v| v.status == 'accepted'}.empty?
        counter += 1
      end
    end
    return (schedule_number - counter)
  end

  def search_found_flat?(property_advertisement)
    unless Flat.all.find_by(property_advertisement: property_advertisement).nil?
      return true
    else
      return false
    end
  end
end
