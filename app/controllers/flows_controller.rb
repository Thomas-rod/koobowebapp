class FlowsController < ApplicationController
  def index
    @flats = current_user.flats
    @flows = current_user.flows.paginate(page: params[:page], per_page: 5).order(payment_date: :desc)
    @incomes = 0
    @flows.where(category: "income").each do |f|
      @incomes += f.amount
    end
    @spendings = 0
    @flows.where(category: "spending").each do |f|
      @spendings += f.amount
    end
    # @flat_incomes = 0
    # @flat_spendings = 0
    # @flats.each do |flat|
    #   @flat = flat
    #   @flat_rentings = flat.rentings
    #   @flat_rentings.each do |renting|
    #     @flat_flows = renting.flows
    #     @flat_flows.each do |flow|
    #       if flow.category == "income"
    #         @flat_incomes += flow.amount
    #       else
    #         @flat_spendings += flow.amount
    #       end
    #     end
    #   end
    # end
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
end

