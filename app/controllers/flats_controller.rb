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
    @flat.update!(pap: false, bienici: false, leboncoin: false, seloger: false, facebook: false)
    redirect_to flat_path(@flat)
  end

  private

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

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :monthly_price, :visible, :rented, :number_of_rooms, :number_of_bedrooms, :surface, :floor, :elevator, :balcony, :cellar, :parking, :furnished, :pap, :leboncoin, :bienici, :seloger, :facebook, :category, heating_system: [], photos: [], technical_diagnostic: [], information_leaflet: [], co_owner_document: [])
  end

  def flat_requests
    @flat_requests = []

    # FIND THE LAST RENTING FROM THIS FLAT (IF THERE IS ONE)
    if !@flat.rentings.select{ |renting| !renting.end_date.nil? }.empty?
      last_renting_date = @flat.rentings.select{ |renting| !renting.end_date.nil? }.last.end_date
      # CHECK IF THERE IS SCHEDULE FOR THIS FLAT
      unless @flat.schedules.nil? || @flat.schedules.empty?
        @flat.schedules.select{ |schedule| schedule.start > last_renting_date}.each do |schedule|
          # CHECK IF THERE IS VISIT FOR THIS SCHEDULE
          unless schedule.visits.order(:status, :created_at).nil? || schedule.visits.order(:status, :created_at).empty?
            schedule.visits.order(:status, :created_at).each do |visit|
              # ADD ALL VISITS TO FLAT_REQUEST
              @flat_requests << visit
              # CHECK IF THERE IS RENTING_FOLDER FOR VISITS
              unless visit.renting_folders.nil?
                visit.renting_folders.each do |renting_folder|
                  # ADD ALL RENTING_FOLDER TO FLAT_REQUEST
                  @flat_requests << renting_folder
                end
              end
            end
          end
        end
      end
    else
      unless @flat.schedules.nil? || @flat.schedules.empty?
        @flat.schedules.each do |schedule|
          # CHECK IF THERE IS VISIT FOR THIS SCHEDULE
          unless schedule.visits.order(:status, :created_at).nil? || schedule.visits.order(:status, :created_at).empty?
            schedule.visits.order(:status, :created_at).each do |visit|
              # ADD ALL VISITS TO FLAT_REQUEST
              @flat_requests << visit
              # CHECK IF THERE IS RENTING_FOLDER FOR VISITS
              unless visit.renting_folders.nil?
                visit.renting_folders.each do |renting_folder|
                  # ADD ALL RENTING_FOLDER TO FLAT_REQUEST
                  @flat_requests << renting_folder
                end
              end
            end
          end
        end
      end
    end

    return @flat_requests
  end

end
