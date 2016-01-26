class Movie < ActiveRecord::Base
	belongs_to:genre, dependent: :destroy
	
	validates :title, :released_on, presence: true
	
	validate :must_have_valid_trailer
	
	def must_have_valid_trailer
		unless trailer.include?("<iframe")
			errors.add(:trailer, "Must include an iframe tag")
		end
	end
end
