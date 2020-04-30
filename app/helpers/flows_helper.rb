module FlowsHelper
  def rent_payed?(flat)
    @rent = flat.flows.select{|f| f.month_rent == DateTime.now.mon && f.year_rent == DateTime.now.year && f.category == "revenu" }
    global_amount = 0
    @rent.each do |flow|
      global_amount += flow.amount
    end
    if @rent && global_amount == flat.monthly_price
      return true
    else
      return false
    end
  end
end
