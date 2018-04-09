def totalpricefunction()

sizefee = 0
  if selectpizzasize == "small"
    sizefee += 0.00
  elsif selectpizzasize == "medium"
    sizefee += 1.00
  else selectpizzasize == "large"
    sizefee += 2.00
  end

  crustfee = 0
    if selectcrust == "skin shavings"
    crustfee += 2.00
    elsif selectcrust == "pan"
      crustfee += 1.00
    else selectcrust == "garlic"
      crustfee += 0
    end

  extracheesefee = 0
  	if yesnoextracheese == "yes"
  		extracheesefee += 1.00
  	else
  		extracheesefee += 0
  	end

    veggiefee = 0
  	if selectveggienumber == 0
  		veggiefee += 0
  	elsif selectveggienumber == 1
  		veggiefee += 1.00
  	elsif selectveggienumber == 2
  		veggiefee += 2.00
  	elsif selectveggienumber == 3
  		veggiefee += 3.00
  	else selectveggienumber == 4
  		veggiefee += 4.00
  	end

    meatfee = 0
    if newmeatnumber == 0
      meatfee += 0
    elsif newmeatnumber == 1
      meatfee += 1.00
    elsif newmeatnumber == 2
      meatfee += 2.00
    elsif newmeatnumber == 3
      meatfee += 3.00
    else newmeatnumber == 4
      meatfee += 4.00
    end



    wingfee = 0
    if yesnowings == "yes"
    		wingfee = 10.00
    	else wingfee = 0
    	end

   drinkfee = 0
    if selectdrinks == "yes"
          drinkfee += 3.00
        else selectdrinks =="no"
          drinkfee += 0
      end

  icecreamfee = 0
    if yesnoicecream == "yes"
      icecreamfee += 3.00
    else yesnoicecream == "no"
      icecreamfee += 0.00
    end


    deliveryfee = 0
    if yesnodelivery == "yes"
      deliveryfee += 5.00
    else yesnodelivery == "no"
      deliveryfee += 0.00
    end

    cost = 10.00 * pizza_number
    tax = 0.07
    before_taxes = cost + icecreamfee + deliveryfee + crustfee + extracheesefee + veggiefee + meatfee + sizefee + wingfee + drinkfee
    salestax = tax * before_taxes.to_f
    total_cost = before_taxes + tax
  end
  
