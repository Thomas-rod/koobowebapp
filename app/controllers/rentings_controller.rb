class RentingsController < ApplicationController
  before_action :notif_visit, :notif_counter;

  def index
    @rentings = current_user.rentings
  end

  def edit
  @renting = Renting.find(params[:id])
  end

  def update
    @renting = Renting.find(params[:id])
    @renting.update(renting_params)
    redirect_to rentings_path
  end

  private

  def renting_params
    params.require(:renting).permit( bails: [], etats_des_lieux: [], quittances: [])
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
