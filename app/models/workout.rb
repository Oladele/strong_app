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
end
