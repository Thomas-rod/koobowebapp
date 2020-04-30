class FlowsController < ApplicationController
  before_action :notif_visit, :notif_counter;

  def index
    @flats = current_user.flats
    @flows = current_user.flows.paginate(page: params[:page], per_page: 4).order(payment_date: :desc)
    @incomes = 0
    if @flows.where(category: "revenu") do
      @flows.where(category: "revenu").each do |f|
        @incomes += f.amount
      end
    end
    @spendings = 0
    if @flows.where(category: "dépense")
      @flows.where(category: "dépense").each do |f|
        @spendings += f.amount if f
      end
    end
  end

  def new
    @flats = current_user.flats
    @flow = Flow.new
  end

  def create
    @flow = Flow.new(flow_params)
    @flow.renting = Flat.find(params["flow"]["renting_id"]).rentings.find_by(status: "current")
      if @flow.save!
        redirect_to flows_path
      else
        render :new
      end
  end

  private

  def flow_params
    params.require(:flow).permit(:renting_id, :payment_date, :amount, :category, :title, :month_rent)
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

