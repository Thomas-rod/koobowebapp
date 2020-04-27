module FlowsHelper
  def rent_payed?(flat)
    @rent = flat.flows.find_by(month_rent: DateTime.now.mon)
    if @rent && @rent.amount == flat.monthly_price
      return true
    else
      return false
    end
  end
end
