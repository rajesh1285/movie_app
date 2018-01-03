class User < ApplicationRecord
   mount_uploader :image, ImageUploader
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable	,:lockable,:timeoutable
   has_many :reviews,dependent: :destroy
   
   validates_presence_of :name


   after_create :send_admin_mail



  def send_admin_mail
   UserMailer.welcome_email(self).deliver_now
  end
end