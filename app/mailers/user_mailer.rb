class UserMailer < ApplicationMailer
  default from: "ecommerce_application@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to the E-commerce Application")
  end  
end
