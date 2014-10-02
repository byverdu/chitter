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
		expect{ fake_sign_up }.to change(User, :count).by(1)
		expect(User.first.user_name).to eq('byverdu')
	end

	scenario "After signs up is redirected to his profile page" do
		fake_sign_up
		expect(current_path).to eq('/user/profile')
	end

	scenario "The email must be unique" do

		visit '/user/new_user'

		expect{ fake_sign_up }.to change(User, :count).by(1)
		expect{ fake_sign_up }.to change(User, :count).by(0)
		
		expect(page).to have_content("Email is already taken")
	end




	def sign_up(email, password, confirm_password, name, user_name)
		
		visit '/user/new_user'

		fill_in :email            ,with: 'alby@example.com'
		fill_in :password         ,with: 's3cr3t'
		fill_in :confirm_password ,with: 's3cr3t'
    fill_in :name             ,with: 'Albert'
    fill_in :user_name        ,with: 'byverdu'

    click_button 'Save Chiter'
	end


end