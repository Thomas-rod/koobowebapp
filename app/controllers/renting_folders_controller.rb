class RentingFoldersController < ApplicationController
  require 'open-uri'

  def update
    @renting_folder = RentingFolder.find(params[:id])
    if @renting_folder.update(status: params[:status])
      if @renting_folder.status == 'denied'
        RentingFolderMailer.with(renting_folder: @renting_folder, renter: @renting_folder.visit.schedule.flat.user, tenant: @renting_folder.visit.user, flat: @renting_folder.visit.schedule.flat).renting_folder_notification_tenant.deliver_now
        redirect_to flat_path(@renting_folder.visit.schedule.flat), notice: "Vous avez refusé la demande de #{@renting_folder.visit.user.first_name.capitalize}"
      else
        @renting = Renting.create(flat: @renting_folder.visit.schedule.flat, start_date: @renting_folder.visit.schedule.flat.start_renting_date, renting_folder: @renting_folder )
        attach_to_renting(@renting)
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
    unless visits_remaining.empty?
      visits_remaining.each do |vr|
        unless vr == @renting_folder.visit || vr.renting == false
          vr.status = 'denied'
          vr.save
          VisitMailer.with(tenant: vr.user, renter: vr.schedule.flat.user, visit: vr).automatic_visit_denied.deliver_now
        end
      end
    end
  end

  def change_remaining_renting_folder_status
    flat = @renting_folder.visit.schedule.flat
    renting_folder_remaining = []
    flat.schedules.each do |s|
      s.visits.each do |v|
        unless v.renting_folder.nil? || v.renting_folder == @renting_folder
          renting_folder_remaining << v.renting_folder if v.renting_folder.status == 'pending'
        end
      end
    end
    unless renting_folder_remaining.empty?
      renting_folder_remaining.each do |rfm|
        rfm.status = 'denied'
        rfm.save
        RentingFolderMailer.with(renting_folder: rfm, renter: rfm.visit.schedule.flat.user, tenant: rfm.visit.user, flat: rfm.visit.schedule.flat).automatic_renting_folder_denied.deliver_now
      end
    end
  end

  def killed_schedules
    flat = @renting_folder.visit.schedule.flat
    flat.schedules.each do |s|
      s.killed = true
      s.save
    end
  end

  def attach_to_renting
    records = @renting.renting_folder.visit.user.records
    records.each_with_index do |record, index|
      attach_file(@renting, rails_blob_path(record.identity_card), "#{index}-identite", )
      identity_card = URI.open(rails_blob_path(record.identity_card))
      @renting.attach()
      file = URI.open(string)
      user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

    end
  end

  def attach_file(renting, string, file_name, content_type)
    file = URI.open(string)
    renting.other_documents.attach(io: file, filename: "#{file_name}", content_type: "#{content_type}")
  end
end
