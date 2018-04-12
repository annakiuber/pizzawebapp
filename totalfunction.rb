def totalpricefunction(final_order)
  total_cost = 0
  before_taxes = 0
  final_order.each do |order_hash|
    p order_hash
    order_hash.each_pair do |item, value|
      p item
      p value

      pizza_number = 0

      sizefee = 0
      if item == "selectpizzasize"
        if value == "small"
          sizefee += 0.00
        elsif value == "medium"
          sizefee += 1.00
        else value == "large"
          sizefee += 2.00
        end
        pizza_number += 1
      end

      crustfee = 0
      if item == "selectcrust"
        if value == "skin shavings"
          crustfee += 2.00
        elsif value == "pan"
          crustfee += 1.00
        else value == "garlic butter"
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

  # selectveggienumber = 0

      veggiefee = 0
      if item == "veg"
        veggiefee = value.length.to_f
        # selectveggienumber += value.length
      end

   # newmeatnumber = 0
      meatfee = 0
      if item == "meats"
        meatfee =  value.length.to_f

      # newmeatnumber += value.length
      end



      wingfee = 10.00
      if item == "selectwings"
        wingfee = wingfee * selectwings.length.to_f
      end


    drinkfee = 3.00
      if item == "selectdrinks"
        drinkfee = drinkfee * selectdrinks.length.to_f
      end

    saladfee = 5.00
    if item == "selectsalads"
      saladfee = saladfee * selectsalads.length.to_f
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
      before_taxes += cost + icecreamfee + deliveryfee + crustfee + extracheesefee + veggiefee + meatfee + sizefee + wingfee + drinkfee + saladfee


    end
  end
  tax = 0.07
  salestax = tax * before_taxes.to_f
  total_cost = before_taxes + tax
  total_cost
end
