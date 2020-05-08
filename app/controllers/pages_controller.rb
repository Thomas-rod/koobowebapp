class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :pricing ]
  before_action :notif_visit, :notif_counter, only: [:dashboard, :search]

  def home
  end

  def dashboard

  end

  def search
    unless current_user.renter?
      @search = params["search"]
      @flats = Flat.geocoded
      if @search.present?
        @flats = @flats.where("property_advertisement ILIKE ?", "#{params[:search][:property_advertisement].downcase}")
        @markers = @flats.map do |flat| {
            lat: flat.latitude,
            lng: flat.longitude,
            infoWindow: render_to_string(partial: "shared/info_window_map", locals: { flat: flat, flat_name: flat.name, flat_price: flat.monthly_price, flat_address: flat.address }),
            image_url: helpers.asset_url('pin_map')
          }
        end
      end
    else
      redirect_to dashboard_path(), notice: "Je t'ai vu venir... Tu ne peux pas accèder à cette page !"
    end
  end

  def pricing
  end

  def politique_confidentialite
  end
  #-----------------------------------#
            private
  #------------------------------------#

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
