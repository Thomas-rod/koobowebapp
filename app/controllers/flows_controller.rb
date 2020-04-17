class FlowsController < ApplicationController
  def index
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
end
