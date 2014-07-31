require 'spec_helper'
	
	feature 'User browses the list of contacts' do 
		before(:each) {
			Contact.create(:name		=>"Jean",
										 :email		=>"jean@troiani.com",
										 :country =>"Venezuela",
										 :tags		=>[Tag.first_or_create(:text=>"family")])

			Contact.create(:name		=>"Maria",
										 :email		=>"maria@romero.com",
										 :country =>"UK",
										:tags		=>[Tag.first_or_create(:text=>"friend")])
											
			Contact.create(:name		=>"Dan",
										 :email		=>"dan@smith.com",
										 :country =>"UK",
										 :tags		=>[Tag.first_or_create(:text=>"work")])
										
									}

			scenario 'When opening the home page' do
				visit '/'
				expect(page).to have_content('Venezuela')
			end
			scenario 'filtered by a tag' do
					visit '/tags/friend'
					expect(page).not_to have_content('Dan')
					expect(page).to have_content('Maria')
			end
	end
	
	feature 'Users adds a new contact' do

			scenario 'when browsing the homepage' do
				expect(Contact.count).to eq(0)
				visit '/'
				add_contact("Jean","jean@troiani.com","Venezuela")
				expect(Contact.count).to eq(1)
				contact=Contact.first
				expect(contact.name).to eq('Jean')
				expect(contact.country).to eq('Venezuela')
			end

			def add_contact(name,email,country,tags=[])
				# save_and_open_page
				within('#new_contact') do
					fill_in 'name', :with => name
					fill_in 'email', :with => email
					fill_in 'country', :with => country
					fill_in 'tags', :with => tags.join(' ')
					click_button 'Add contact'
				end

			end

			scenario 'with a few tags' do
				visit '/'
				add_contact('jean','jean@troiani.com','Venezuela',['family','friends'])

				contact=Contact.first
				expect(contact.tags.map(&:text)).to include('family')
				expect(contact.tags.map(&:text)).to include('friends')
			end


	end




		
