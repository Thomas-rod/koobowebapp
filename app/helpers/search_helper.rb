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
    # raise
    return (schedule_number - counter)
  end
end
