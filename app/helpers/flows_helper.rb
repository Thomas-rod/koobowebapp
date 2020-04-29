module FlowsHelper
  def rent_payed?(flat)
    @rent = flat.flows.select{|f| f.month_rent == DateTime.now.mon && f.category == "income" }
    amount_global = 0
    @rent.each do |flow|
      amount_global += flow.amount
    end
    if @rent && amount_global == flat.monthly_price
      return true
    else
      return false
    end
  end
end
