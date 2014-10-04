require 'timecop'
require "./app/models/user"

describe Chitter do

	it "has all this properties" do

		user = User.create(email:'alby@example.com',password:'s3cr3t',password_confirmation:'s3cr3t',
			          name:'Albert',user_name:'byverdu')

		time = Time.local(2014,02,10,12,0)

		Timecop.freeze(time)
		
		expect(Chitter.count).to eq(0)	

		Chitter.create(content: 'Always testing', at_time: time,
			             name: user.name, user_name: user.user_name)

		expect(Chitter.count).to eq(1)

		chit = Chitter.first

		expect(chit.content).to   eq('Always testing')
		expect(chit.at_time).to   eq(time)
		expect(chit.name).to      eq('Albert')
		expect(chit.user_name).to eq('byverdu')
	end

end