feature "Signing up" do

	def fake_sign_up
		sign_up('alby@example.com', 's3cr3t', 's3cr3t', 'Albert', 'byverdu')
	end


	scenario "User can sign up" do
		visit '/'
		click_link 'Sign Up'
		expect(current_path).to eq('/user/new_user')
	end

	scenario "Has to sign up for the first time visits the page" do
		fake_sign_up
		expect(User.count).to eq(1)
		expect(User.first.user_name).to eq('byverdu')
	end

	scenario "After signs up is redirected to his profile page" do
		fake_sign_up
		expect(current_path).to eq('/user/profile')
	end

	scenario "The email must be unique" do

		expect{ fake_sign_up }.to change(User, :count).by(1)
		expect{ fake_sign_up }.to change(User, :count).by(0)
		
		expect(page).to have_content("Email is already taken")
	end

	scenario "The user name must be unique" do

		expect{ fake_sign_up }.to change(User, :count).by(1)
		expect{ fake_sign_up }.to change(User, :count).by(0)
		
		expect(page).to have_content("User name is already taken")
	end

	xscenario "The password and password confirmation must match" do 
		visit '/user/new_user'

		expect{ sign_up('alby@example.com', 's3cr3t', 's3cr3t0', 'Albert', 'byverdu') }.to change(User, :count).by(0)
		
		expect(page).to have_content("Password does not match the confirmation")
		expect(current_path).to eq('/user/new_user')
	end
end


def sign_up(email, password, password_confirmation, name, user_name)
	
	visit '/user/new_user'

	fill_in :email                 ,with: 'alby@example.com'
	fill_in :password              ,with: 's3cr3t'
	fill_in :password_confirmation ,with: 's3cr3t'
  fill_in :name                  ,with: 'Albert'
  fill_in :user_name             ,with: 'byverdu'

  click_button 'Save Chiter'
end