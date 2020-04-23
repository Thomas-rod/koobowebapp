class FlowsController < ApplicationController
  def index
    @flats = current_user.flats
    @schedules = Schedule.all
    @flows = Flow.all.paginate(page: params[:page], per_page: 5).order(payment_date: :desc)
    @incomes = 0
    Flow.where(category: "income").each do |f|
      @incomes += f.amount
    end
    @spendings = 0
    Flow.where(category: "spending").each do |f|
      @spendings += f.amount
    end
    @flat_flows = Flow.find_by_sql("
      SELECT * FROM flows
      JOIN rentings ON rentings.id = flows.renting_id
      JOIN flats ON flats.id = rentings.flat_id
      JOIN users ON users.id = flats.user_id
      ORDER BY flows.payment_date desc
      ")
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

