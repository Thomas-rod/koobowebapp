class FlatsController < ApplicationController
  def index
    @flats = current_user.flats
    @schedules = Schedule.all
    @documents = Document.all
  end

  def show
    @flat = Flat.find(params[:id])
    @schedule = Schedule.new
  end

  def new
    @flat = Flat.new
    @user = current_user
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
      if @flat.save
        redirect_to edit_publication_path
      else
        render :new
      end
  end

  def edit_publication
    @flat = Flat.find(params[:id])
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :monthly_price, :visible, :rented, :number_of_rooms, :number_of_bedrooms, :surface, :floor, :elevator, :balcony, :cellar, :parking, :heating_system, :furnished, :pap, :leboncoin, :bienici, :seloger, photos: [])
  end
end
