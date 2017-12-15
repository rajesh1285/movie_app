class Movie < ApplicationRecord
    has_many :reviews,dependent: :destroy
	mount_uploader :image, ImageUploader
end
