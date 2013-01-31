# == Schema Information
#
# Table name: exercise_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExerciseCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :exercises
  
  validates :name, 	presence: true, length: {maximum: 100}, uniqueness: { case_sensitive: false }
end
