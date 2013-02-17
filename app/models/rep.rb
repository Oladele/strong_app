# == Schema Information
#
# Table name: reps
#
#  id                   :integer          not null, primary key
#  workout_id           :integer
#  exercise_id          :integer
#  weight_additional_kg :float            default(0.0)
#  notes                :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  exercise_name        :string(255)
#

class Rep < ActiveRecord::Base
  attr_accessible :exercise_id, :notes, :weight_additional_kg, :workout_id
  
  belongs_to :workout, :inverse_of => :reps
  belongs_to :user

  #validates :workout_id, presence: true
  #issue with nested forms failing with validates
  
  default_scope order: 'reps.created_at ASC'

  
  def work_joule
  	Exercise.find(exercise_id).work_joule(weight_additional_kg)
  end

  def weight_additional_lb()
    w_kg = weight_additional_kg
    uw_kg = Unit.new("#{w_kg} kg")
    uw_lb = uw_kg >> "lb"
    w_lb = uw_lb.scalar.to_f.round
  end

end
