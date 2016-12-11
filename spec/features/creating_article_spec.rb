require "rails_helper"

#this is a test method
RSpec.feature "Creating Articles" do
	
	scenario "A user creates a new article" do
		#STEPS:
		# visit root page
		# click on new article
		# fill in title
		# fill in body
		# create article
		
		visit "/" #this sign means root
		
		#capybara methods
		click_link "New Article"
		
		fill_in "Title", with: "Creating a blog"
		fill_in "Body", with: "Lorem Ipsum"
		
		click_button "Create Article"
		
		expect(page).to have_content("Article has been created")
		expect(page.current_path).to eq(articles_path)
		
	end

end