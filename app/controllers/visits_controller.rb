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
     @visit.update(visit_params)
     redirect_to schedules_path
    # switch visit status to accepted
    # Broadcast to locataire (recup l'id du locataire)
  end

  def params_visit
    params.require(:visit).permit(:schedule_id)
  end
end
