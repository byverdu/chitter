describe User do

	context "Every User will have this properties" do

		it "will have 4 properties when is created" do

			expect(User.count).to eq 0

			User.create(email:       "alby@domain.io",
									pswd_digest: "s3cr3t",
									name:        "Albert Byverdu",
									user_name:   "byverdu"
								)

			expect(User.count).to eq 1

			user = User.first

			expect(user.email).to        eq("alby@domain.io")
			expect(user.pswd_digest).to  eq("s3cr3t")
			expect(user.name).to         eq("Albert Byverdu")
			expect(user.user_name).to    eq("byverdu")

			user.destroy

			expect(User.count).to eq 0
		end

	end


end