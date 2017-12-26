class ReviewMailer < ApplicationMailer

def thankyou_email(review,user,movie)
    @user = user
    @review =review
    @movie = movie

    
    mail(to: @user.email, subject: "Thanks for your Time to Review ")
  end

end
