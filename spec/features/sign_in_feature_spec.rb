feature "Signing In" do

  before(:each) do

		User.create(email: "alby@domain.io", password: 's3cr3t',password_confirmation: "s3cr3t",
		            name: "Albert Byverdu",  user_name: "byverdu")
	end

	scenario "A user can sign in" do
		
		visit '/'
		click_link 'Sign In'
    
    expect(current_path).to eq('/session/new_session')
	end

	scenario "After signing in is redirect to his profile page" do
		
		sign_in('byverdu','s3cr3t')

		expect(page).to have_content('Welcome byverdu')
		expect(current_path).to eq('/user/profile')
	end

	scenario "the user can sign out" do

		sign_in('byverdu','s3cr3t')
    click_button 'Sign Out'
		
		expect(current_path).to eq('/')
	end

	scenario "If the user don't signs out the session still alive" do
  
    sign_in('byverdu','s3cr3t')
    visit '/'
    expect(current_path).to eq('/user/profile')
	end
end


def sign_in(user_name, password)

	visit '/session/new_session'

	fill_in :user_name,             with: 'byverdu'
	fill_in :password,              with: 's3cr3t'

	click_button 'Welcome'
end

