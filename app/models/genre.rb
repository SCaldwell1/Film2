class Genre < ActiveRecord::Base
	has_many:movies
	
	validates :name, uniqueness: true
end
