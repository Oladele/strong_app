module WorkoutsHelper
	def kg_to_lb(w_kg)
	    uw_kg = Unit.new("#{w_kg} kg")
	    uw_lb = uw_kg >> "lb"
	    w_lb = uw_lb.scalar.to_f.round
  	end

  	def lb_to_kg(w_lb)
	    uw_lb = Unit.new("#{w_lb} lb")
	    uw_kg = uw_lb >> "kg"
	    w_kg = uw_kg.scalar.to_f.round
  	end
end
