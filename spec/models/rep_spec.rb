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

require 'spec_helper'

describe Rep do
  pending "add some examples to (or delete) #{__FILE__}"
end
