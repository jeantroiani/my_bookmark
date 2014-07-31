class Tag

	include DataMapper::Resource

has n, :contacts, :through => Resource
	
		property :id 			,Serial
		property :text		,String

	end