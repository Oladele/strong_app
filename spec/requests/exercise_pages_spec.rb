require 'spec_helper'

describe "ExercisePages" do
  
  subject { page }

  	describe "Exercise page" do
	  	before {visit exercise_path}

	  	it { should have_selector('h1',    text: 'Exercises') }
	    it { should have_selector('title', text: full_title('Exercises')) }
    end
end
