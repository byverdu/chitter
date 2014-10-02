feature "Managing the user" do

	scenario "Has to sign up for the first time visits the page" do

		visit '/'

		sign_up( 'alby@example.com', "s3cr3t", "s3cr3t", 'Albert', 'byverdu' )

	end

	def sign_up(email, password, confirm_password, name, user_name)
		
		visit '/new_user'

		fill_in 'email',            with: 'alby@example.com'
		fill_in 'password',         with: 's3cr3t'
		fill_in 'confirm_password', with: 's3cr3t'
    fill_in 'name',             with: 'Albert'
    fill_in 'user_name',        with: 'byverdu'

    click_button 'Save Chiter'
	end


end