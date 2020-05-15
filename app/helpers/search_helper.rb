module SearchHelper

  def available_schedule_number(flat)
    counter = 0
    schedule_number = flat.schedules.count

    flat.schedules.each do |schedule|
      schedule_visits =  schedule.visits
      unless schedule_visits.select{ |v| v.status == 'accepted'}.empty?
        counter += 1
      end
    end
    raise
    return (schedule_number - counter)
  end

  def search_found_flat?(property_advertisement)
    unless Flat.all.find_by(property_advertisement: property_advertisement).nil?
      return true
    else
      return false
    end
  end

  def schedule_available_for_visit(flat)
    flat_rented = flat.is_there_renting?
    if flat_rented.empty?
      return flat.schedules.select{ |s| s.booked == false}
    else
      # I use . first because in is_there_renting? method it's sorted by status. (Current is at first place)
      return flat.schedules.select{ |s| s.start > flat_rented.first.start_date && s.booked == false}
    end
  end

  def total_schedule_available_for_visit(flat)
    flat_rented = flat.is_there_renting?
    if flat_rented.empty?
      return flat.schedules
    else
      # I use . first because in is_there_renting? method it's sorted by status. (Current is at first place)
      return flat.schedules.select{ |s| s.start > flat_rented.first.start_date}
    end
  end

  def rewrite_schedule_available(array_schedules)
    array_schedules_with_style = []
    array_schedules.each do |schedule|
      array_schedules_with_style << ["#{schedule.id}", "Visite #{l(schedule.start, format: "%d %B")} de #{l(schedule.start, format: "%kh%M")} à #{l(schedule.end, format: "%kh%M")}"]
    end
    return array_schedules_with_style
  end
end
