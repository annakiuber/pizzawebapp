def totalpricefunction(pizza_number, order_hash)
  total_cost = 0
  order_hash.each do |item, value|

    sizefee = 0
    if item == "selectpizzasize"
      if value == "small"
        sizefee += 0.00
      elsif value == "medium"
        sizefee += 1.00
      else value == "large"
        sizefee += 2.00
      end
    end

    crustfee = 0
    if item == "selectcrust"
      if value == "skin shavings"
        crustfee += 2.00
      elsif value == "pan"
        crustfee += 1.00
      else value == "garlic"
        crustfee += 0
      end
    end

    extracheesefee = 0
    if item == "yesnoextracheese"
      if value == "yes"
        extracheesefee += 1.00
      else
        extracheesefee += 0
      end
    end

    veggiefee = 0
    if item == "selectveggienumber"
      if value == 0
        veggiefee += 0
      elsif value == 1
        veggiefee += 1.00
      elsif value == 2
        veggiefee += 2.00
      elsif value == 3
        veggiefee += 3.00
      else value == 4
        veggiefee += 4.00
      end
    end

    meatfee = 0
    if item == "newmeatnumber"
      if value == 0
        meatfee += 0
      elsif value == 1
        meatfee += 1.00
      elsif value == 2
        meatfee += 2.00
      elsif value == 3
        meatfee += 3.00
      else value == 4
        meatfee += 4.00
      end
    end



    wingfee = 0
    if item == "yesnowings"
      if value == "yes"
        wingfee = 10.00
      else wingfee = 0
        wingfee += 0
      end
    end

    drinkfee = 0
    if item == "selectdrinks"
      if value == "yes"
        drinkfee += 3.00
      else value =="no"
        drinkfee += 0
      end
    end

    icecreamfee = 0
    if item == "yesnoicecream"
      if value == "yes"
        icecreamfee += 3.00
      else value == "no"
        icecreamfee += 0.00
      end
    end


    deliveryfee = 0
    if item == "yesnodelivery"
      if value == "yes"
        deliveryfee += 5.00
      else value == "no"
        deliveryfee += 0.00
      end
    end

    cost = 10.00 * pizza_number.to_i
    tax = 0.07
    before_taxes = cost + icecreamfee + deliveryfee + crustfee + extracheesefee + veggiefee + meatfee + sizefee + wingfee + drinkfee
    salestax = tax * before_taxes.to_f
    total_cost = before_taxes + tax

  end
  total_cost
end
