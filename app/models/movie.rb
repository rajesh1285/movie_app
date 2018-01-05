class Movie < ApplicationRecord
	acts_as_votable

    
	
	has_many :views, dependent: :destroy
    has_many :reviews ,dependent: :destroy
	mount_uploader :image, ImageUploader
	 
      validates :rating, numericality: { less_than_or_equal_to: 10 }
    validates :title,:genr,:plot,:image,:rating,:website,:year, presence: true
      
 def self.search(search)
  where("title LIKE ?", "%#{search}%") 
 end
 
end

