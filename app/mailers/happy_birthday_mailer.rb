class HappyBirthdayMailer < ApplicationMailer
  before_action :set_well_wisher_and_birthday_celebrant

  def wish_happy_gregorian_birthday_email
    mail(
      to: email_address_with_name(@well_wisher.email, @well_wisher.name),
      subject: "It's #{@birthday_celebrant.name.possessive} birthday today!"
      )
  end

  def wish_happy_hijri_birthday_email
    mail(
      to: email_address_with_name(@well_wisher.email, @well_wisher.name),
      subject: "It's #{@birthday_celebrant.name.possessive} waras today!"
      )
  end

  private

  def set_well_wisher_and_birthday_celebrant
    @well_wisher = params[:user]
    @birthday_celebrant = params[:birthday_buddy]
  end
end
