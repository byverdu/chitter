describe Chiter do

	it "has all this properties" do
		
		expect(Chiter.count).to eq(0)	

		Chiter.create(content: 'Always testing')

		expect(Chiter.count).to eq(1)

		chit = Chiter.first

		expect(chit.content).to eq('Always testing')
	end

end