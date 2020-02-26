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
    # Broadcast au proprio (recup l'id du proprio) pour la notif et le schedule
    redirect_to new_flat_visit_path
  end

  def update
    # switch visit status to accepted
    # Broadcast to locataire (recup l'id du locataire)
  end

  def params_visit
    params.require(:visit).permit(:schedule_id)
  end
end
