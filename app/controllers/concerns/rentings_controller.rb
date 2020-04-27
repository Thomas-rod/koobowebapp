class RentingsController < ApplicationController

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
end

