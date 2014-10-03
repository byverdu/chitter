describe User do

	it "has all this properties" do

		expect(User.count).to eq(0)

		User.create(email:       'alby@example.com',
								pswd_digest: 's3cr3t',
								name:        'Albert',
								user_name:   'byverdu'
								)

		expect(User.count).to eq(1)

		user = User.first

		expect(user.email).to        eq('alby@example.com')
		expect(user.pswd_digest).to  eq('s3cr3t')
		expect(user.name).to         eq('Albert')
		expect(user.user_name).to    eq('byverdu')

		user.destroy

		expect(User.count).to eq(0)
	end 
end