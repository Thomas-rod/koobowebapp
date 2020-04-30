module FlatHelper

# RENTER HELPER

  # RETURN ALL VISITS ACCEPTED
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

  # RETURN ALL RENTING_FOLDERS REQUEST
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

  # RETURN AN ARRAY OF ALL TENANTS IN MY RENTING
  def helper_flat_current_tenants(flat)
    unless (flat.rentings.select{ |renting| renting.status == 'current' }.nil? || flat.rentings.select{ |renting| renting.status == 'current' }.empty?)
      return flat.rentings.select{ |renting| renting.status == 'current' }.first.renting_folder.users
    else
      return flat.rentings.select{ |renting| renting.status == 'ongoing' }.first.renting_folder.users
    end
  end

# TENANT HELPER

  def user_current_renting?(user)
    unless user.renting_folders.nil?
      user_renting_folders_accepted = user.renting_folders.select{|r| r.status == "accepted"}
      user_renting_folders_accepted.each do |r|
        if r.renting.status == "current"
          return true
        end
      end
    end
    return false
  end

  def user_current_renting(user)
    unless user.renting_folders.nil?
      user_renting_folders_accepted = user.renting_folders.select{|r| r.status == "accepted"}
      user_renting_folders_accepted.each do |r|
        if r.renting.status == "current"
          return r.renting
        end
      end
    end
  end

end
