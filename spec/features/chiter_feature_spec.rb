require 'timecop'

feature "On the home page" do

	time = Time.local(2014,02,10,12,0)

	Timecop.freeze(time)

	before(:each) do 


		Chiter.create(content: 'Always testing', at_time: time)
	end

	scenario "The user visits the page for first time" do
		visit '/'

		expect(page).to have_content('Welcome to Chiter')
		expect(page).to have_link( 'Sign Up' )
		expect(page).to have_content('Always testing')
		expect(page).to have_content(time)
	end


end