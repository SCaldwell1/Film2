class Movie < ActiveRecord::Base
	belongs_to:genre, dependent: :destroy
	
	validates :title, :released_on, presence: true
end
