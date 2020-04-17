class FlatsController < ApplicationController
  before_action :notif_visit, :notif_counter;
  helper_method :check;

  def index
    @flats = current_user.flats
    @schedules = Schedule.all
  end

  def show
    find_flat
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
        redirect_to edit_publication_path(@flat)
      else
        render :new
      end
  end

  def edit_publication
    find_flat
  end

   def update_publication
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to recap_publication_path(@flat)
  end

  def recap_publication
    find_flat
  end

  def edit
    find_flat
    render :new
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def check(num)
    if num < 10
      0.to_s + num.to_s
    else
      num
    end
  end

  private

  def notif_counter
    @visit_pending_flat = notif_visit
    @counter_calendar = @visit_pending_flat.length
    @counter_appartement = 0
    @counter_profil = 0
    @counter = @counter_appartement + @counter_calendar + @counter_profil

  end

  def notif_visit
    pending_visit_all = Visit.where('status LIKE ?', 'pending')
    visit_pending_flat = []
    pending_visit_all.each do |visit|
      if visit.schedule.flat.user.id == current_user.id
       visit_pending_flat << visit
      end
    end
    visit_pending_flat
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end


  def flat_params
    params.require(:flat).permit(:name, :address, :description, :monthly_price, :visible, :rented, :number_of_rooms, :number_of_bedrooms, :surface, :floor, :elevator, :balcony, :cellar, :parking, :furnished, :pap, :leboncoin, :bienici, :seloger, heating_system: [], photos: [])
  end
end
