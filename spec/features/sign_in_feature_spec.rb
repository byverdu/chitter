feature "Signing In" do

	scenario "A user can sign in" do

		visit '/'
		
		click_link 'Sign In'

		expect(current_path).to eq('/session/new')
	end


end

# def sig_in(user_name, password, confirm_password)

# 	visit '/session/new'



# end