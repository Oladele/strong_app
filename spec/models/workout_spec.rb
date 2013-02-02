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

require 'spec_helper'

describe Workout do
  pending "add some examples to (or delete) #{__FILE__}"
end
