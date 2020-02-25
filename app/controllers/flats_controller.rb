class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
    @user = current_user
  end

  def create
    @flat.user = current_user
    @flat = Flat.new(flat_params)
      if @flat.save
        redirect_to flats_path
      else
        render :new
      end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :monthly_price, :visible, :rented, photos: [])
  end
end
