feature "On the home page" do

	before(:each) do 
		Chiter.create(content: 'Always testing')
	end

	scenario "The user visits the page for first time" do
		visit '/'

		expect(page).to have_content('Welcome to Chiter')
		expect(page).to have_content('Always testing')
	end


end