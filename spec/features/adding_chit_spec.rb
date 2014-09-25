# feature 'User browsers the list of chitts' do

# 	before(:each){

# 		Chitt.create( user: 'Byverdu', content: 'Hello world')
# 		User.create( email:'alby@domain.io', password:'s3cr3t', password_confirmation: 's3cr3t',
# 								 name: "Albert Byverdu", user_name: 'Byverdu'  )
# 	}

# 		scenario "on the home page" do

# 			visit '/'

# 			expect(page).to have_content('Byverdu')
# 			expect(page).to have_content('Hello world')

# 		end

# 	feature "User adds a new link" do

# 	  scenario "when browsing the home page" do
      

#       expect(Chitt.count).to eq(1)

#       visit '/'

#       add_chitt("Hello world")

#       expect(Chitt.count).to eq(2)

#       chitt = Chitt.first
#       user  = User.first

#       expect(chitt.user).to    eq(user.user_name)
#       expect(chitt.content).to eq("Hello world")
# 	  end
	
# 	def add_chitt(content)
		
# 		within('.add_chitt') do

# 			fill_in 'content', with: "Hello world"
# 			click_button "Chitt Mate"
# 		end
# 	end

# 	end
# end
