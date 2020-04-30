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
      if @flat.save!
        redirect_to edit_publication_path(@flat)
      else
        render :new
      end
  end

  def edit
    find_flat
    render :edit
  end

  def edit_publication
    find_flat
  end

  def recap_publication
    find_flat
  end

  def update
    find_flat
    @flat.update!(flat_params)
    redirect_to edit_publication_path(@flat)
  end

  def update_publication
    find_flat
    @flat.update!(flat_params)
    redirect_to recap_publication_path(@flat)
  end

  def upload_document
    find_flat
    if params[:flat].nil?
      redirect_to flat_path(@flat), alert: "Attention, tu dois sélectionner un fichier Youston"
    else
      which_document = which_document_upload
      type_document = params[:flat][which_document.to_sym].content_type
      file_name = params[:flat][which_document.to_sym].original_filename
      path_to_file = params[:flat][which_document.to_sym].tempfile
      @flat.send(which_document).attach(
        io: File.open(path_to_file),
        filename: file_name,
        content_type: type_document,
        identify: false
        )
      if @flat.update(flat_params)
        redirect_to flat_path(@flat), notice: "Super, ton fichier a bien été téléchargé Youston"
      else
        redirect_to flat_path(@flat), alert: @flat.errors.messages["#{which_document_upload}_format".to_sym].first
      end
    end
  end

  def purge_document
    find_flat
    unless params[:file].nil?
      # raise
      file = params[:file]
      @flat.send(file).purge
      redirect_to flat_path(@flat), notice: "C'est bon, le document a été supprimé !"
    else
      redirect_to flat_path(@flat), alert: "Jeff, on a un soucis. Contacte nous par mail bokoo@koobo.co"
    end
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
    @flat.pap = false
    @flat.bienici = false
    @flat.leboncoin = false
    @flat.seloger = false
    @flat.facebook = false
    @flat.update!(flat_params)
    redirect_to flat_path(@flat)
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :monthly_price, :rented, :number_of_rooms, :number_of_bedrooms, :surface, :floor, :elevator, :balcony, :cellar, :parking, :furnished, :pap, :leboncoin, :bienici, :seloger, :facebook, :category, heating_system: [], photos: [], technical_diagnostic: [], information_leaflet: [], co_owner_document: [])
  end

  def which_document_upload
    if !params[:flat][:technical_diagnostic].nil?
      return "technical_diagnostic"
    elsif !params[:flat][:information_leaflet].nil?
      return "information_leaflet"
    elsif !params[:flat][:co_owner_document].nil?
      return "co_owner_document"
    else
      raise
    end
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
