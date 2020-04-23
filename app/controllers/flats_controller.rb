class FlatsController < ApplicationController
  before_action :notif_visit, :notif_counter;
  helper_method :check;

  # CRUD

  def index
    @flats = current_user.flats
    @schedules = Schedule.all
  end

  def show
    find_flat
    @schedule = Schedule.new
    flat_requests
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
    find_flat
    @flat.update(flat_params)
    redirect_to recap_publication_path(@flat)
  end

  def recap_publication
    find_flat
  end

  def edit
    find_flat
    render :edit
  end

  def update
    find_flat
    @flat.update(flat_params)
    redirect_to edit_publication_path(@flat)
  end

  # HELPER OTHERS

  def check(num)
    if num < 10
      0.to_s + num.to_s
    else
      num
    end
  end

  # WILL USE THIS ONE TO UPDATE WHERE FLAT IS PUBLISHED
  def disable_publication
    find_flat
    @flat.update!(pap: false, bienici: false, leboncoin: false, seloger: false)
    redirect_to flat_path(@flat)
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

  def flat_requests
    @flat_requests = []
    unless current_user.schedules.nil?
      current_user.schedules.each do |schedule|
        unless schedule.visits.nil?
          schedule.visits.order(:status, :created_at).each do |visit|
            @flat_requests << visit
            unless visit.renting_folders.nil?
              visit.renting_folders.each do |renting_folder|
                @flat_requests << renting_folder
              end
            end
          end
        end
      end
    end
    return @flat_requests
  end

end
