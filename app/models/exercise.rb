# == Schema Information
#
# Table name: exercises
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  exercise_category_id :integer
#  movement             :string(255)
#  rep_distance         :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Exercise < ActiveRecord::Base
  attr_accessible :movement, :name, :rep_distance, :exercise_category_id
  belongs_to :exercise_category

  validates :name, 	presence: true, length: {maximum: 100}, uniqueness: { case_sensitive: false }
  validates :exercise_category_id, 	presence: true

end
