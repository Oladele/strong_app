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
end
