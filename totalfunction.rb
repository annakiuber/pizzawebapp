def totalpricefunction(final_order)
  total_cost = 0
  before_taxes = 0
  final_order.each do |order_hash|
    order_hash.each_pair do |item, value|
      before_taxes += cost_finder(item,value)
    end
  end
  tax = 0.07
  salestax = tax * before_taxes.to_f
  total_cost = before_taxes + tax
  total_cost
end

def cost_finder(item, value)
  fee = 0
  if item == "selectpizzasize"
    if value == "small"
      fee = 0.00
      fee += 10.00
    elsif value == "medium"
      fee = 1.00
      fee += 10.00
    else value == "large"
      fee = 2.00
      fee += 10.00
    end
  elsif item == "selectcrust"
    if value == "skin shavings"
      fee = 2.00
    elsif value == "pan"
      fee = 1.00
    else value == "garlic butter"
      fee = 0
    end
  elsif item == "yesnoextracheese"
    if value == "yes"
        fee = 1.00
    else
      fee = 0
    end
  elsif item == "veg"
    fee = value.length.to_f
  elsif item == "meats"
    fee =  value.length.to_f

  elsif item == "selectwings"
    fee = 10.00
    fee = fee * value.length.to_f
  elsif item == "selectdrinks"
    fee = 3.00
    fee = fee * value.length.to_f
  elsif item == "selectsalads"
    fee = 5.00
    fee = fee * value.length.to_f
  elsif item == "yesnoicecream"
    if value == "yes"
      fee = 3.00
    else value == "no"
      fee = 0.00
    end
  elsif item == "yesnodelivery"
    if value == "yes"
      fee = 5.00
    else value == "no"
      fee = 0.00
    end
  end
  fee
end

# totalpricefunction([{"selectpizzasize"=>"small", "selectcrust"=>"pan", "meats"=>["hamburger"], "veg"=>["peppers", "spinach", "green mold from the dumpster out back"], "yesnoextracheese"=>nil},{"yesnowings"=>"No", "yesnosalad"=>"Yes", "yesnodrinks"=>"Yes", "yesnoicecream"=>"Yes", "yesnodelivery"=>"No", "yesnotip"=>"No", "tipamount"=>""}])
