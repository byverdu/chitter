feature	"User signs up" do

	scenario "when being log out" do
		expect{ sign_up }.to change(User, :count).by(1)

		expect(page).to have_content('Welcome to Chitter alby@domain.io')
		expect(User.first.email).to eq('alby@domain.io')
	end

	scenario "with a password that doesn´t match" do

		expect{ sign_up('alby@domain','pass','wrong') }.to change(User, :count).by(0)

		expect(current_path).to eq('/user')
		expect(page).to have_content("Password does not match the confirmation")
	end

	scenario "with an email that is already registered" do

		expect{ sign_up }.to change(User, :count).by(1)
		expect{ sign_up }.to change(User, :count).by(0)
		expect(page).to have_content("Email is already take")
	end

	def sign_up(email                  = 'alby@domain.io',
							password               = 's3cr3t',
							password_confirmation  = 's3cr3t',
							name                   = 'Albert Byverdu',
							user_name              = 'byverdu')

		visit '/user/new'

		expect(page.status_code).to eq(200)
		
		fill_in :email, 								with: email
		fill_in :password, 							with: password
		fill_in :password_confirmation, with: password_confirmation
		fill_in :name, 									with: name
		fill_in :user_name, 						with: email

		click_button "Sign Up"
	end

end























