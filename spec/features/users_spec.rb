require 'spec_helper'
describe "User", :js => true do

	describe "A person can create an account" do 
		it "by clicking on the signup button and registering" do 
			visit root_path
			find('.signin_link').click
			fill_in "Username",  :with => "Example1"
			fill_in "Password", :with => "Example1"
			fill_in "Password confirmation", :with => "Example1"
			find('.button').click
			visit root_path
			expect(page).to have_content "Sign Out"
		end
	end

	describe "An existing user can log in" do
		it "by clicking the log in button" do 
			user = User.create(username: "Example2", password: "123")
			visit root_path
			find('.login_link').click
			fill_in "Username", :with => "Example2"
			fill_in "Password", :with => "123"
			find('.button').click
			visit root_path
			expect(page).to have_content "Sign Out"
		end

		it "logged in user has the option of creating an answer" do 
			user = User.create(username: "Example2", password: "123")
			visit root_path
			find('.login_link').click
			fill_in "Username", :with => "Example2"
			fill_in "Password", :with => "123"
			find('.button').click
			visit root_path
			expect(page).to have_button('Ask a New Question')
		end

		it "cannot ask a new question if not logged in" do 
			visit root_path
			expect(page).to_not have_button('Ask a New Question')
		end
		

	end
end