class SchedulesController < ApplicationController
  before_action :notif_visit, :notif_counter;
  helper_method :check;

  def index
  @flats = renting?
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

  def check(num)
    if num < 10
      0.to_s + num.to_s
    else
      num
    end
  end
  def day_selected(day, other_day)
   if day == orher_day
   return "selected"
   else
   return "unselected"
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
    @counter_appartement = 0
    @counter_calendar = notif_visit.length
    @counter_document = 0
    @counter_accounting = 0
    @counter_profil = 0
    @counter = @counter_appartement + @counter_calendar + @counter_document + @counter_accounting + @counter_profil
    return @counter
  end

  def notif_visit
    pending_visit_all = Visit.where('status LIKE ?', 'pending')
    visit_pending_flat = []
    pending_visit_all.each do |visit|
      if visit.schedule.flat.user.id == current_user.id
       visit_pending_flat << visit
      end
    end
    return visit_pending_flat
  end

  def params_schedule
    params.require(:schedule).permit(:start, :end)
  end
end
