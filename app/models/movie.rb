class Movie < ApplicationRecord
	acts_as_votable
	belongs_to :user
	
	has_many :views
    has_many :reviews,dependent: :destroy
	mount_uploader :image, ImageUploader
      
 def self.search(search)
  where("title LIKE ?", "%#{search}%") 
 end
 
end

