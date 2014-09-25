feature	"User signs up" do

	scenario "when being log out" do
		expect{ sign_up }.to change(User, :count).by(1)

		expect(page).to have_content('Welcome to Chitter Byverdu')
		expect(User.first.user_name).to eq('Byverdu')
	end

	scenario "with a password that doesn´t match" do

		expect{ sign_up('alby@domain','s3cr3t','s3cr3t0','Albert Byverdu','Byverdu') }.to change(User, :count).by(0)

		expect(current_path).to eq('/users')
		expect(page).to have_content("Password does not match the confirmation")
	end

	scenario "with an email that is already registered" do

		expect{ sign_up }.to change(User, :count).by(1)
		expect{ sign_up }.to change(User, :count).by(0)
		expect(page).to have_content("Email is already take")
	end


end

feature "User signs in" do

	before(:each) do

		User.create(email: "alby@domain.io", password: 's3cr3t',password_confirmation: "s3cr3t",
		            name: "Albert Byverdu", user_name: "Byverdu")
	end

	scenario "with the correct credentials" do
    
    visit '/'

    expect(page).not_to have_content("Welcome to Chitter Byverdu")

		sign_in( "Byverdu", 's3cr3t' )


		expect(page).to have_content('Welcome to Chitter Byverdu')
  end

  scenario "with the incorrect credentials" do

  	visit '/'
  	expect(page).not_to have_content('Welcome to Chitter Byverdu')
  		sign_in( 'Byverdu', 's3cr3t0' )
  	expect(page).not_to have_content('Welcome to Chitter Byverdu')
  end
end


feature "when the user signs out" do

	before(:each) do

		User.create(email: "alby@domain.io", password: 's3cr3t',password_confirmation: "s3cr3t",
		            name: "Albert Byverdu", user_name: "Byverdu")
	end

	scenario 'while being signed in' do
    
    sign_in('Byverdu', 's3cr3t')
    
    click_button "Sign Out"
    
    expect(page).to have_content("Good bye!") # where does this message go?
    expect(page).not_to have_content("Welcome to Chitter Byverdu")
  end

end

	def sign_in(user_name,password)
		
		visit '/sessions/new'

		fill_in 'user_name', with: user_name
		fill_in 'password',  with: password

		click_button 'Sign In'
	end




	def sign_up(email                  = 'alby@domain.io',
							password               = 's3cr3t',
							password_confirmation  = 's3cr3t',
							name                   = 'Albert Byverdu',
							user_name              = 'Byverdu')

		visit '/users/new'

		expect(page.status_code).to eq(200)
		
		fill_in :email, 								with: email
		fill_in :password, 							with: password
		fill_in :password_confirmation, with: password_confirmation
		fill_in :name, 									with: name
		fill_in :user_name, 						with: user_name

		click_button "Sign Up"
	end


















