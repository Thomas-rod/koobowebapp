class FlatsController < ApplicationController
  before_action :notif_counter

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
    flat_params[:heating_system].each do |param|
      if param != " "
        @flat.heating_system << param
      end
    end
    @flat.user = current_user
      if @flat.save
        redirect_to edit_publication_path(@flat)
      else
        render :new
      end
  end

  def edit_publication
    @flat = Flat.find(params[:id])
  end

   def update_publication
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    # redirect_to flat_path(@flat)
  end

  def edit
    @flat = Flat.find(params[:id])
    render :new
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  private

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
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :monthly_price, :visible, :rented, :number_of_rooms, :number_of_bedrooms, :surface, :floor, :elevator, :balcony, :cellar, :parking, :furnished, :pap, :leboncoin, :bienici, :seloger, heating_system: [], photos: [])
  end
end
