require 'timecop'
require "./app/models/user"

feature "On the home page" do

	time = Time.local(2014,02,10,12,0)

	Timecop.freeze(time)

	before(:each) do 


		Chitter.create(content: 'Always testing', at_time: time)
	end

	scenario "The user visits the page for first time" do
		visit '/'

		expect(page).to have_content('Welcome to Chitter')
		expect(page).to have_link( 'Sign Up' )
		expect(page).to have_link( 'Sign In' )
		expect(page).to have_content('Always testing')
		expect(page).to have_content(time.strftime("%d/%b/%Y at %H:%M"))
	end
end

feature "Posting a chit" do
	time = Time.local(2014,02,10,12,0)

	Timecop.freeze(time)

	before(:each) do 
    user = User.create(email: "alby@domain.io", password: 's3cr3t',password_confirmation: "s3cr3t",
		            name: "Albert",  user_name: "byverdu")

    sign_in('byverdu','s3cr3t')

		Chitter.create(content: 'Always testing', at_time: time, 
			            name: user.name, user_name: user.user_name)
	end

	scenario "The user must be log in" do

		fill_in 'content', with: 'Always testing'

		click_button 'Post a chit'

		expect(page).to have_content('Always testing')
		expect(page).to have_content(time.strftime("%d/%b/%Y at %H:%M"))
		expect(page).to have_content('Albert')
		expect(page).to have_content('byverdu')
		expect(current_path).to eq('/user/profile')
	end
end
























