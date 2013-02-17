# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  date       :time
#  duration   :integer
#  weigh_in   :float
#  notes      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Workout < ActiveRecord::Base
  attr_accessible :date, :duration, :notes, :user_id, :weigh_in, :reps_attributes
  
  belongs_to :user, :inverse_of => :workouts
  has_many :reps, inverse_of: :workout, dependent: :destroy
  accepts_nested_attributes_for :reps, allow_destroy: :true

  validates :user_id, presence: true

  default_scope order: 'workouts.created_at DESC'

  def work_joule()
  	if self.reps.any? 
  		work = 0.0
  		self.reps.all.each do |r| 
  			work += r.work_joule  				
  		end
  		return work.round
  	else
  			0.0
  	end
	end

  def weight_lifted_kg()
    if self.reps.any? 
      w = 0.0
      self.reps.all.each do |r| 
        w += r.weight_additional_kg         
      end
      return w.round
    else
        0.0
    end
  end

  def weight_lifted_lb()
    w_kg = weight_lifted_kg
    uw_kg = Unit.new("#{w_kg} kg")
    uw_lb = uw_kg >> "lb"
    w_lb = uw_lb.scalar.to_f.round
  end

	
end
