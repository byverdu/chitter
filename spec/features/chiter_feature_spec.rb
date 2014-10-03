require 'timecop'
require "./app/lib/user"

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
		expect(page).to have_link( 'Sign In' )
		expect(page).to have_content('Always testing')
		expect(page).to have_content(time)
	end
end

feature "Posting a chit" do
	time = Time.local(2014,02,10,12,0)

	Timecop.freeze(time)

	before(:each) do 
    User.create(email: "alby@domain.io", password: 's3cr3t',password_confirmation: "s3cr3t",
		            name: "Albert Byverdu",  user_name: "byverdu")

    sign_in('byverdu','s3cr3t')

		Chiter.create(content: 'Always testing', at_time: time)
	end

	scenario "The user must be log in" do

		expect(current_path).to eq('/user/profile')

		
	end
end