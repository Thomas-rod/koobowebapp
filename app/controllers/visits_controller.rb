class VisitsController < ApplicationController
  def new
    @flat = Flat.find(params[:flat_id])
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(params_visit)
    @visit.user = current_user
    @visit.status = 'pending'
    @visit.save!
    UserChannel.broadcast_to(
      @visit.schedule.flat.user,
      render_to_string(partial: "shared/notif", locals: { visit: @visit })
    )
    redirect_to new_flat_visit_path
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

end
