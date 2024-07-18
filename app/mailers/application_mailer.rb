class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name(Rails.application.credentials.dig(:mailer, :email), "BirthdayBuddies")
  layout "mailer"
end
