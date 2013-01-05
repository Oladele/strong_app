require 'spec_helper'

describe "StaticPages" do

	let(:base_title) { "Strongla" }
  
	describe "Home page" do

		it "should have the h1 'Strongla'" do
		  visit '/static_pages/home'
		  page.should have_selector('h1', text:'Strongla')
		end
		it "should have the title 'Strongla|Home'" do
		  visit '/static_pages/home'
		  page.should have_selector('title', text:"#{base_title}|Home")
		end
	end

	describe "Help page" do

		it "should have the h1 'Help'" do
		  visit '/static_pages/help'
		  page.should have_selector('h1', text:'Help')
		end
		it "should have the title 'Strongla|Help'" do
		  visit '/static_pages/help'
		  page.should have_selector('title', text:"#{base_title}|Help")
		end
	end

	describe "About page" do

		it "should have the h1 'About Strongla'" do
		  visit '/static_pages/about'
		  page.should have_selector('h1', text:'About Strongla')
		end
		it "should have the title 'Strongla|About'" do
		  visit '/static_pages/about'
		  page.should have_selector('title', text:"#{base_title}|About")
		end
	end

	describe "Contact page" do

		it "should have the h1 'Contact Us'" do
		  visit '/static_pages/contact'
		  page.should have_selector('h1', text:'Contact Us')
		end
		it "should have the title 'Strongla|Contact'" do
		  visit '/static_pages/contact'
		  page.should have_selector('title', text:"#{base_title}|Contact")
		end
	end
end
