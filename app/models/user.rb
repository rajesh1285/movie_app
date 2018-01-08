class User < ApplicationRecord

   acts_as_voter
   mount_uploader :image, ImageUploader
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable	,:lockable,:timeoutable,:omniauthable, omniauth_providers: %i[facebook]
   has_many :reviews,dependent: :destroy
   has_many :movies
   validates_presence_of :name


   after_create :send_admin_mail



  def send_admin_mail
   UserMailer.welcome_email(self).deliver_now
  end

   def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end