class UserMailer < ActionMailer::Base
  helper :application
  include Devise::Controllers::UrlHelpers

  def welcome(name)
    @greeting = "Hi" + name.to_s

    mail(to: "ashishg@qburst.com", from: "aqburst@gmail.com", subject: "Welcome - ")
  end
end
