require 'data_mapper'
require 'sinatra/base'

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
	require './lib/contacts.rb'
	require './lib/tags.rb'
	DataMapper.finalize
	DataMapper.auto_migrate!


class Contacts < Sinatra::Base
	set :root, File.join(File.dirname(__FILE__),'..')
	set :views, Proc.new { File.join(File.dirname(__FILE__), '..', "views")}
	

	get '/' do
		@contacts = Contact.all
		erb :index
	end

	post '/new_contact' do
		name		=params[:name]
		email		=params[:email]
		country	=params[:country]
		tags		=params[:tags].split(" ").map do |tag|
						 Tag.first_or_create(:text => tag)
						 end
		Contact.create(:name => name,:email => email,:country => country,:tags => tags)

	end



end