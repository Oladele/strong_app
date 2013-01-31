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

require 'spec_helper'

describe Exercise do

	let(:exercise_cat) { FactoryGirl.create(:exercise_category) }
	before { @exercise = exercise_cat.exercises.build(name: "example exercise") }

	#before do 
    #	@exercise = Exercise.new(name: "Example Exercise")
    #end

	subject { @exercise }

	it { should respond_to(:name) }
	it { should respond_to(:exercise_category_id) }
	it { should respond_to(:exercise_category) }
  	its(:exercise_category) { should == exercise_cat }

	it { should be_valid }
  	
  	
  	describe "when name is not present" do
    	before { @exercise.name = " " }
    	it { should_not be_valid }
	end

	describe "when name is too long" do
	    before { @exercise.name = "a"*101 }
	    it { should_not be_valid }
	end

	describe "when name is already taken" do
    before  do
      ex_with_same_name = @exercise.dup
      ex_with_same_name.name = @exercise.name.upcase
      ex_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "when category_id is not present" do
    before { @exercise.exercise_category_id = nil }
    it { should_not be_valid }
  end

	describe "accessible attributes" do
		it "should not allow access to category_id" do
			expect do
				Exercise.new(exercise_category_id: exercise_cat.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end    
	end
end
