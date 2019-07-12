class UserMailer < ApplicationMailer
 default from: 'rajesh.n12440@gmail.com'
 
  def welcome_email(user)
    @user = user
    
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
