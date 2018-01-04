class Movie < ApplicationRecord
	acts_as_votable
	
	has_many :views
    has_many :reviews,dependent: :destroy
	mount_uploader :image, ImageUploader
      
 def self.search(search)
  where("title LIKE ?", "%#{search}%") 
 end
 
end

