class UserMailer < ApplicationMailer
  default :from => 'streetisyoursapp@gmail.com'
  layout 'mailer'

  def signup_email(user)
    @user = user
    mail( :to => @user.email, :subject => 'Thanks for signing up on Street Is Yours app!' )
  end
end
