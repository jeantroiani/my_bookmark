require 'data_mapper'
require 'sinatra/base'


	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
	require './lib/contacts.rb'
	DataMapper.finalize
	DataMapper.auto_migrate!




class Contacts < Sinatra::Base
	set :views, Proc.new { File.join(root,"views") }
	set :root, File.join(File.dirname(__FILE__),'..')


end