class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
 
  after_create :send_admin_mail



  def send_admin_mail
  UserMailer.welcome_email(self).deliver_now
  
  end


end	