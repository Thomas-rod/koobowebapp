class FlowsController < ApplicationController
  before_action :notif_visit, :notif_counter;

  def index
    @flats = current_user.flats
    @flows = current_user.flows.paginate(page: params[:page], per_page: 4).order(payment_date: :desc)
    @incomes = 0
    @flows.where(category: "income").each do |f|
      @incomes += f.amount
    end
    @spendings = 0
    @flows.where(category: "spending").each do |f|
      @spendings += f.amount
    end
  end

  def new
    @flow = Flow.new
  end

  def create
    @flow = Flow.new(flow_params)
      if @flow.save!
        redirect_to flows_path
      else
        render :new
      end
  end

  private

  def flow_params
    params.require(:flow).permit(:name, :address, :description, :monthly_price, :visible, :rented, :number_of_rooms, :number_of_bedrooms, :surface, :floor, :elevator, :balcony, :cellar, :parking, :furnished, :pap, :leboncoin, :bienici, :seloger, :facebook, :category, heating_system: [], photos: [], technical_diagnostic: [], information_leaflet: [], co_owner_document: [])
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

