class WelcomeMailerJob < ActiveJob::Base
  queue_as :welcome

  def perform(name)
    UserMailer.welcome(name).deliver_now
  end
end

