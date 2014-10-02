require 'timecop'

describe Chiter do

	it "has all this properties" do

		time = Time.local(2014,02,10,12,0)

		Timecop.freeze(time)
		
		expect(Chiter.count).to eq(0)	

		Chiter.create(content: 'Always testing', at_time: time)

		expect(Chiter.count).to eq(1)

		chit = Chiter.first

		expect(chit.content).to eq('Always testing')
		expect(chit.at_time).to eq(time)
	end

end