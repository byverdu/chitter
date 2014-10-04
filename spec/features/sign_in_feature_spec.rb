feature "Signing In" do

	scenario "A user can sign in" do
		
		visit '/'
		click_link 'Sign In'
    
    expect(current_path).to eq('/session/new_session')
	end

	scenario "After signing in with the correct credentials is redirect to his profile page" do

		User.create(email: "alby@domain.io", password: 's3cr3t',password_confirmation: "s3cr3t",
	 	            name: "Albert Byverdu",  user_name: "byverdu")

		sign_in('byverdu','s3cr3t')

		expect(page).to have_content('Welcome byverdu')
		expect(current_path).to eq('/user/profile')
	end

	scenario "Trying to sign in with a wrong user_name" do

		sign_in('Byver','s3cr3t')
		expect(page).not_to have_content('Welcome byverdu')
		expect(page).to     have_content('There is a problem with your email or password')
	end

	scenario "Trying to sign in with a wrong password" do

		sign_in('byverdu','s3cr3t0')
		expect(page).not_to have_content('Welcome byverdu')
		expect(page).to     have_content('There is a problem with your email or password')
	end

end

feature "Signing Out" do

	before(:each) do

		User.create(email: "alby@domain.io", password: 's3cr3t',password_confirmation: "s3cr3t",
		            name: "Albert Byverdu",  user_name: "byverdu")
	end

	scenario "the user can sign out" do

		sign_in('byverdu','s3cr3t')
    click_button 'Sign Out'
		
		expect(current_path).to eq('/')
	end
end


def sign_in(user_name, password  )

	visit '/session/new_session'

	fill_in :user_name,             with: user_name
	fill_in :password,              with: password

	click_button 'Welcome'
end

