class SchedulesController < ApplicationController
before_action :notif_visit, :notif_counter;
helper_method :check
  def index
  @flats = renting?
  @documents = Document.all
  @visits_user = visits_user
  end

  def create
    @schedule = Schedule.new(params_schedule)
    @flat = Flat.find(params[:flat_id])
    @schedule.flat = @flat
    @schedule.save!
    if request.referer.include?('edit_publication')
      redirect_to edit_publication_path(@flat)
    else
      redirect_to flat_path(@flat)
    end
  end

  # WE WILL NEED AN OTHER ROUTES TO REDIRECT TO THE CALENDAR WHEN WE ARE ON CALENDAR
  # def create_from_calendar
  #   @schedule = Schedule.new(params_schedule)
  #   @flat = Flat.find(params[:flat_id])
  #   @schedule.flat = @flat
  #   @schedule.save!
  #   redirect_to schedules_path
  # end
  def check(num)
    if num < 10
      0.to_s + num.to_s
    else
      num
    end
  end
  private

  def visits_user
    visit_user =[]
    Visit.all.each do |visit|
      if visit.schedule.flat.user == current_user
        visit_user << visit
      end
    end
    visit_user
  end

  def renting?
    unrented_flat = current_user.flats.select do |flat|
      flat.rentings == []
    end
    unrented_flat
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
    visit_pending_flat
  end

  def params_schedule
    params.require(:schedule).permit(:start, :end)
  end
end
