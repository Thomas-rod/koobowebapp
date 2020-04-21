module FlatHelper
  def helper_accepted_flat_requests(array)
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

  def helper_renting_folders_request(array)
    renting_folders = []
    array.each do |request|
      if request.is_a?(RentingFolder)
        renting_folders << request
      end
    end
    return renting_folders
  end

end
