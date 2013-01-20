require 'spec_helper'

describe ExerciseCategory do

	before do 
    	@exercise_cat = ExerciseCategory.new(name: "Example Category")
    end

	subject { @exercise_cat }

	it { should respond_to(:name) }
	it { should be_valid }
  	
  	
  	describe "when name is not present" do
    	before { @exercise_cat.name = " " }
    	it { should_not be_valid }
	end

	describe "when name is too long" do
	    before { @exercise_cat.name = "a"*101 }
	    it { should_not be_valid }
	end

	describe "when name is already taken" do
    before  do
      cat_with_same_name = @exercise_cat.dup
      cat_with_same_name.name = @exercise_cat.name.upcase
      cat_with_same_name.save
    end

    it { should_not be_valid }
  end

end