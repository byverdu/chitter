feature "Signing up" do

	def fake_sign_up
		sign_up('alby@example.com', 's3cr3t', 's3cr3t', 'Albert', 'byverdu')
	end

	scenario "Has to sign up for the first time visits the page" do
		expect{ fake_sign_up }.to change(User, :count).by(1)
		expect(User.first.user_name).to eq('byverdu')
	end

	scenario "After signs up is redirected to his profile page" do
		fake_sign_up
		expect(current_path).to eq('/user/profile')
	end



	# xscenario "The email must be unique" do

	# 	visit '/'

	# 	expect{ sign_up }
	# 	expect{ sign_up }

	# 	expect(page).to have_content('This email is already taken')
	# 	expect(current_path).to eq('/user/new_user')
	# end

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