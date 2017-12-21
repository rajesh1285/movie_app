class Movie < ApplicationRecord
	searchkick
	has_many :views
    has_many :reviews,dependent: :destroy
	mount_uploader :image, ImageUploader
end
