module IndexVisitHelper


  #*------------------------------------*#
    #USED THOSE TWO TO WRAP ON INFOWINDOW FOR ONE FLAT
  #*------------------------------------*#

  def flat_visit_current_cuser(flat, user)
    visit_tenant = []
    flat.schedules.each do |schedule|
      schedule.visits.each do |visit|
        if !visit.user.nil? && visit.user == user
          visit_tenant << visit
        end
      end
    end
  return visit_tenant
  end

  def flat_renting_folder_current_user(flat, user)
    renting_folder_tenant = []
    flat.schedules.each do |schedule|
      schedule.visits.each do |visit|
        unless visit.renting_folder.nil?
          renting_folder_tenant << visit.renting_folder
        end
      end
    end
    return renting_folder_tenant
  end
end
