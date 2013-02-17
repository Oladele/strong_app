# == Schema Information
#
# Table name: exercises
#
#  id                              :integer          not null, primary key
#  name                            :string(255)
#  exercise_category_id            :integer
#  movement                        :string(255)
#  rep_distance                    :float
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  dfactor_body_up                 :float            default(0.0)
#  dfactor_body_down               :float            default(0.0)
#  dfactor_body_lat                :float            default(0.0)
#  dfactor_body_static_tension_max :float            default(0.0)
#  dfactor_body_static_tension_min :float            default(0.0)
#  wfactor_body_up                 :float            default(0.0)
#  wfactor_body_down               :float            default(0.0)
#  wfactor_body_lat                :float            default(0.0)
#  wfactor_body_static_tension_max :float            default(0.0)
#  wfactor_body_static_tension_min :float            default(0.0)
#

class Exercise < ActiveRecord::Base
	attr_accessible :movement, :name, :rep_distance, :exercise_category_id, 
		:dfactor_body_up, :dfactor_body_down, :dfactor_body_lat, 
			:dfactor_body_static_tension_max, :wfactor_body_up, 
				:wfactor_body_down, :wfactor_body_lat, 
					:wfactor_body_static_tension_max
	belongs_to :exercise_category

	validates :name, 	presence: true, length: {maximum: 100}, uniqueness: { case_sensitive: false }
	validates :exercise_category_id, 	presence: true

	@@body_height_m = 1.7
	@@body_weight_kg = 72.5
	@@accel_gravity = 9.8

	@@gfactor_up = 0.5
	@@gfactor_down = 0.5
	@@gfactor_lat = 0.25
	@@gfactor_static_tension_max = 0.4
	@@gfactor_static_tension_min = 0.1

	def work_joule(weight_addional_kg)
		work_additional_joule(weight_addional_kg) + work_body_joule()
	end	

	def work_additional_joule(weight_addional_kg)
		work_up = weight_addional_kg*@@accel_gravity*@@gfactor_up*
					@@body_height_m*dfactor_body_up
		work_down = weight_addional_kg*@@accel_gravity*@@gfactor_down*
					@@body_height_m*dfactor_body_down
		work_lat = weight_addional_kg*@@accel_gravity*@@gfactor_lat*
					@@body_height_m*dfactor_body_lat		
		
		work_static_tension_max = weight_addional_kg*@@accel_gravity*@@gfactor_static_tension_max*
					@@body_height_m*dfactor_body_static_tension_max
		
		work_static_tension_min = weight_addional_kg*@@accel_gravity*@@gfactor_static_tension_min*
					@@body_height_m*dfactor_body_static_tension_min
		
		work_up+work_down+work_lat+work_static_tension_max+work_static_tension_min
	end

	def work_body_joule()
		work_up = @@body_weight_kg*@@accel_gravity*@@gfactor_up*
					wfactor_body_up*@@body_height_m*dfactor_body_up
		work_down = @@body_weight_kg*@@accel_gravity*@@gfactor_down*
					wfactor_body_down*@@body_height_m*dfactor_body_down
		work_lat = @@body_weight_kg*@@accel_gravity*@@gfactor_lat*
					wfactor_body_lat*@@body_height_m*dfactor_body_lat		
		
		work_static_tension_max = @@body_weight_kg*@@accel_gravity*@@gfactor_static_tension_max*
					wfactor_body_static_tension_max*@@body_height_m*dfactor_body_static_tension_max
		
		work_static_tension_min = @@body_weight_kg*@@accel_gravity*@@gfactor_static_tension_min*
					wfactor_body_static_tension_min*@@body_height_m*dfactor_body_static_tension_min
		
		work_up+work_down+work_lat+work_static_tension_max+work_static_tension_min
	end

	def set_dfactor_body(up, down, lat, static_max, static_min)
		self.dfactor_body_up = up
		self.dfactor_body_down = down
		self.dfactor_body_lat = lat
		self.dfactor_body_static_tension_max = static_max
		self.dfactor_body_static_tension_min = static_min
	end

	def set_wfactor_body(up, down, lat, static_max, static_min)
		self.wfactor_body_up = up
		self.wfactor_body_down = down
		self.wfactor_body_lat = lat
		self.wfactor_body_static_tension_max = static_max
		self.wfactor_body_static_tension_min = static_min
	end
end
