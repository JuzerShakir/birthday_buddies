class HappyBirthdayMailer < ApplicationMailer
  def wish_happy_gregorian_birthday_email
    @well_wisher = params[:user]
    @birthday_celebrant = params[:birthday_buddy]

    mail(to: email_address_with_name(@well_wisher.email, @well_wisher.name), subject: "It's #{@birthday_celebrant.name.possessive} birthday today!" )
  end

  def wish_happy_hijri_birthday_email
    @well_wisher = params[:user]
    @birthday_celebrant = params[:birthday_buddy]

    mail(to: email_address_with_name(@well_wisher.email, @well_wisher.name), subject: "It's #{@birthday_celebrant.name.possessive} waras today!" )
  end
end
