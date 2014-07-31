require 'spec_helper'

describe Contact do
	
	context "Demonstration of how datamapper works" do
		it 'should be created and then retrieved from the databse' do
			expect(Contact.count).to eq(0)

		Contact.create(:name   => "Jean",
									 :email  => "jean@troiani.com",
								   :country=> "Venezuela")
		
		expect(Contact.count).to eq(1)
		
		contact= Contact.first

		expect(contact.name).to eq("Jean")
		expect(contact.country).to eq("Venezuela")

		contact.destroy

		expect(Contact.count).to eq(0)
		end


	end	



end