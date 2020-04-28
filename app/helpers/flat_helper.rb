module FlatHelper
  def helper_flat_accepted_flat_requests(array)
    accepted_visit = []
    array.each do |request|
      if request.is_a?(Visit)
        if request.status == 'accepted'
          accepted_visit << request
        end
      end
    end
    return accepted_visit
  end

  def helper_flat_renting_folders_request(array)
    renting_folders = []
    array.each do |request|
      if request.is_a?(RentingFolder)
        renting_folders << request
      end
    end
    return renting_folders
  end

  # HELP ME TO KNOW IF THERE IS A TENANT INSIDE THE FLAT (it could be past rentings)
  def tenant?(flat)
    return true unless flat.rentings.select{ |renting| renting.status == 'current' }.nil? || flat.rentings.select{ |renting| renting.status == 'current' }&.empty?
  end

  def helper_flat_current_tenants(flat)
    unless (flat.rentings.select{ |renting| renting.status == 'current' }.nil? || flat.rentings.select{ |renting| renting.status == 'current' }.empty?)
      return flat.rentings.select{ |renting| renting.status == 'current' }.first.renting_folder.users
    else
      return flat.rentings.select{ |renting| renting.status == 'ongoing' }.first.renting_folder.users
    end

  end

end
