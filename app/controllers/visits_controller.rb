class VisitsController < ApplicationController
  before_action :notif_visit, :notif_counter;

  #-----------------------------------#
                #CRUD
  #------------------------------------#
  def index
    @records = Record.all.select{ |r| r.user == current_user}
    @visits = Visit.select {|v| v.user == current_user}
    @renting_folders = RentingFolder.select { |r| r.visit.user == current_user}
    find_flat(@visits, @renting_folders)
    @markers = @flats.map do |flat| {
            lat: flat.latitude,
            lng: flat.longitude,
            infoWindow: render_to_string(partial: "shared/info_window_map_visit", locals: { flat: flat, flat_name: flat.name, flat_price: flat.monthly_price, flat_address: flat.address }),
            image_url: helpers.asset_url('pin_map')
          }
    end

  end


  def new
    @flat = Flat.find(params[:flat_id])
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(params_visit)
    @visit.user = current_user
    @visit.status = 'pending'
    if @visit.save
      # VisitMailer.new_visit(@visit).deliver_now
      UserChannel.broadcast_to(
        @visit.schedule.flat.user,
        render_to_string(partial: "shared/notif", locals: { visit: @visit })
      )
      redirect_to visits_path, notice: 'Votre demande de visite a bien été envoyé !'
    else
      redirect_to request.referrer, notice: 'Aïe ! Il y a eu un soucis.'
    end
  end

  def update
     @visit = Visit.find(params[:id])
     @visit.update(params_visit)
     @schedule = Schedule.find(params[:schedule_id])
     if @visit.status == "denied"
      redirect_to request.referrer, notice: "Vous venez de refuser la demande de #{@visit.user.first_name} !"
     else
       deny_pending_visits
       @schedule.update(booked: true)
       redirect_to request.referrer, notice: "Vous venez d'accepter la demande de #{@visit.user.first_name} ! Les autres demandes ont été annulées"
     end
     VisitMailer.with(tenant: @visit.user, visit: @visit).send_answer_visit_mail.deliver_now
    # switch visit status to accepted
    # Broadcast to locataire (recup l'id du locataire
  end

  def update_renting_visit_default
    @visit = Visit.find(params[:id])
    @visit.renting = ""
    @visit.save!
    redirect_to visits_path, notice: "Tu peux maintenant déposer ton dossier"
  end

  def update_renting_visit_false
    @visit = Visit.find(params[:id])
    @visit.renting = false
    @visit.save!
    redirect_to visits_path, notice: "Tu n'as pas donné suite à cette visite"
  end

  def update_renting_visit_true
    @visit = Visit.find(params[:id])
    @visit.renting = true
    @visit.save!
    RentingFolder.create(visit: @visit, status: 'pending')
    redirect_to visits_path, notice: "Ton dossier a été envoyé"
  end


  #-----------------------------------#
            private
  #------------------------------------#

  def params_visit
    params.require(:visit).permit(:schedule_id, :status, :people, :income, :contract, :phone, :renting, :message)
  end

  def deny_pending_visits

    pending_visits = @schedule.visits.select{ |v| v.status != 'accepted'}
    pending_visits.each do |visit|
     visit.status = "denied"
     visit.save
     VisitMailer.with(tenant: visit.user, visit: visit).send_answer_visit_mail.deliver_now
    end
  end

  def find_flat(visits, renting_folders)
    @flats = []
    visits.each do |visit|
      @flats << visit.schedule.flat
    end
    renting_folders.each do |renting_folder|
      unless !@flats.select{|f| f == renting_folder.visit.schedule.flat}.empty?
        @flats << renting_folder.visit.schedule.flat
      end
    end
    return @flats
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

