describe User do

	it "has all this properties" do

		expect(User.count).to eq(0)

		User.create(email:     'alby@example.com',
								password:  's3cr3t',
								name:      'Albert',
								user_name: 'byverdu'
								)

		expect(User.count).to eq(1)

		user = User.first

		expect(user.email).to     eq('alby@example.com')
		expect(user.password).to  eq('s3cr3t')
		expect(user.name).to      eq('Albert')
		expect(user.user_name).to eq('byverdu')

	end 
end