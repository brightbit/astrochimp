module Astrochimp
  class SignupMailer < ActionMailer::Base
    default from: ENV['AC_MAIL_FROM']

    def signup_complete(signup)
      @signup = signup
      mail(to: signup.email, subject: ENV['AC_MAIL_SUBJECT'])
    end
  end
end
