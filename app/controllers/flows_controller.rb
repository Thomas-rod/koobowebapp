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
  end
end
