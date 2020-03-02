class DocumentsController < ApplicationController
before_action :notif_counter
  def index
    @flats = current_user.flats
    @schedules = Schedule.all
    @documents = Document.all
    @documents = Document.all
    @flats_rented = flats_rented
    @rentings = Renting.all
  end

  private

  def flats_rented
    flats_rented = []
    flats = Flat.all
    flats.each do |flat|
      if !flat.rentings.empty?
        flats_rented << flat
      end
    end
    flats_rented
  end

  def notif_counter
    @visit_pending_flat = notif_visit
    @counter_calendar = @visit_pending_flat.length
    @counter_appartement = 0
    @counter_documents = 0
    @counter_profil = 0
    @counter = @counter_appartement + @counter_calendar + @counter_documents + @counter_profil
  end

  def notif_visit
    pending_visit_all = Visit.where('status LIKE ?', 'pending')
    visit_pending_flat = []
    pending_visit_all.each do |visit|
      if visit.schedule.flat.user == current_user
       visit_pending_flat << visit
      end
    end
  end
end
