class Contact

	include DataMapper::Resource

	property :id 			,Serial
	property :name		,String, length: 2..20, required: true
	property :email		,String, format: :email_address
	property :country ,String, length: 2..20, required: true
end