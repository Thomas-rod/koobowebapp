class VisitsController < ApplicationController
  before_action :notif_visit, :notif_counter;

  def new
    @flat = Flat.find(params[:flat_id])
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(params_visit)
    @visit.user = current_user
    @visit.status = 'pending'
    if @visit.save
      UserChannel.broadcast_to(
        @visit.schedule.flat.user,
        render_to_string(partial: "shared/notif", locals: { visit: @visit })
      )
      redirect_to new_flat_visit_path
    else
      redirect_to new_flat_visit_path
    end
  end

  def update
     @visit = Visit.find(params[:id])
     @visit.update(params_visit)
     @schedule = Schedule.find(params[:schedule_id])
     if @visit.status == "denied"
      redirect_to schedules_path(anchor: "scheduled#{@schedule.id}")
     else
       deny_pending_visits
       redirect_to schedules_path(anchor: "scheduled#{@schedule.id}")
     end
    # switch visit status to accepted
    # Broadcast to locataire (recup l'id du locataire
  end


  private

  def params_visit
    params.require(:visit).permit(:schedule_id, :status)
  end

  def deny_pending_visits
    pending_visits = @schedule.visits.select do |visit|
     visit.status != "accepted"
    end
    pending_visits.each do |visit|
     visit.status = "denied"
     visit.save
    end
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

end

