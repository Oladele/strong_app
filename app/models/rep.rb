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
#  work_joule           :float
#

class Rep < ActiveRecord::Base
  include WorkoutsHelper

  attr_accessible :exercise_id, :notes, :weight_additional_kg, :weight_additional_lb, :workout_id, :work_joule
  
  belongs_to :workout #, :inverse_of => :reps
  #belongs_to :user

  #validates :workout_id, presence: true
  #issue with nested forms failing with validates
  
  default_scope order: 'reps.created_at ASC'
  
  #before_create :work_joule_private
  before_save :update_private
  #after_save :work_joule_private
  #after_create :work_joule_private
  #after_commit :work_joule_private
  #before_validation :work_joule_private
  #after_validation :work_joule_private




  def work_joule_func
  	#Exercise.find(exercise_id).work_joule(weight_additional_kg)
    work_joule=1
  end

  def weight_additional_lb()
    #w_kg = weight_additional_kg
    #uw_kg = Unit.new("#{w_kg} kg")
    #uw_lb = uw_kg >> "lb"
    #w_lb = uw_lb.scalar.to_f.round
    w_lb = kg_to_lb(weight_additional_kg)
  end

  def weight_additional_lb=(x)
    #uw_lb = Unit.new("#{x} lb")
    #uw_kg = uw_lb >> "kg"
    #self.weight_additional_kg = uw_kg.scalar.to_f
    self.weight_additional_kg = lb_to_kg(x)
    #self.weight_additional_kg = x
  end

  def update_private
    #Exercise.find(exercise_id).work_joule(weight_additional_kg)
    #self.work_joule = 5.0
    self.work_joule = Exercise.find(exercise_id).work_joule(weight_additional_kg)
    self.exercise_name = Exercise.find(exercise_id).name
  end

  def update
    #not yet in use. 2/24 (Dele). 
    #Need to refactor to use observer pattern so that these values
    #get updated when Exercise model is updated
    #Exercise.find(exercise_id).work_joule(weight_additional_kg)
    #@work_joule_private = 5.0
    self.work_joule = Exercise.find(exercise_id).work_joule(weight_additional_kg)
    self.exercise_name = Exercise.find(exercise_id).name
  end

end
