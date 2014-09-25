feature 'User browsers the list of chitts' do

	before(:each){

		Chitt.create( user: 'Byverdu', content: 'Hello world')
	}

	scenario "on the home page" do

		visit '/'

		expect(page).to have_content('Byverdu')
		expect(page).to have_content('Hello world')

	end
end
