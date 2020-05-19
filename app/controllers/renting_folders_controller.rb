class RentingFoldersController < ApplicationController
  def update
    @renting_folder = RentingFolder.find(params[:id])
    if @renting_folder.update(status: params[:status])
      if @renting_folder.status == 'denied'
        RentingFolderMailer.with(renting_folder: @renting_folder, renter: @renting_folder.visit.schedule.flat.user, tenant: @renting_folder.visit.user, flat: @renting_folder.visit.schedule.flat).renting_folder_notification_tenant.deliver_now
        redirect_to flat_path(@renting_folder.visit.schedule.flat), notice: "Vous avez refusé la demande de #{@renting_folder.visit.user.first_name.capitalize}"
      else
        Renting.create(flat: @renting_folder.visit.schedule.flat, start_date: @renting_folder.visit.schedule.flat.start_renting_date, renting_folder: @renting_folder )
        RentingFolderMailer.with(renting_folder: @renting_folder, renter: @renting_folder.visit.schedule.flat.user, tenant: @renting_folder.visit.user, flat: @renting_folder.visit.schedule.flat).renting_folder_notification_tenant.deliver_now
        redirect_to flat_path(@renting_folder.visit.schedule.flat), notice: "Super ! Vous avez accepté la demande de #{@renting_folder.visit.user.first_name.capitalize}"
        change_remaining_renting_folder_status
        change_visits_remaining_status
        killed_schedules
      end
    end
  end

  private

  def renting_folder_params
    params.require(:renting_folder).permit(:visit, :status)
  end

  def change_visits_remaining_status
    flat = @renting_folder.visit.schedule.flat
    visits_remaining = flat.visits.select{|v| v.status == 'pending' || v.status == 'accepted'}
    visits_remaining.each do |vr|
      unless vr == @renting_folder.visit && vr.renting == false
        vr.status = 'denied'
        vr.save
        VisitMailer.with(tenant: vr.user, renter: vr.schedule.flat.user, visit: vr).automatic_visit_denied.deliver_now
      end
    end
  end

  def change_remaining_renting_folder_status
    flat = @renting_folder.visit.schedule.flat
    renting_folder_remaining = []
    flat.schedules.each do |s|
      s.visits.each do |v|
        unless v.renting_folder.nil? && v.renting_folder == @renting_folder
          renting_folder_remaining << v.renting_folder if v.renting_folder.status == 'pending'
        end
      end
    end
    renting_folder_remaining.each do |rfm|
      rfm.status = 'denied'
      rfm.save
      RentingFolderMailer.with(renting_folder: rfm, renter: rfm.visit.schedule.flat.user, tenant: rfm.visit.user, flat: rfm.visit.schedule.flat).automatic_renting_folder_denied.deliver_now
    end
  end

  def killed_schedules
    flat = @renting_folder.visit.schedule.flat
    flat.schedules.each do |s|
      s.killed = true
      s.save
    end
  end
end
