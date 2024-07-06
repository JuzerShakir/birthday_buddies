class HappyBirthdayMailer < ApplicationMailer
  before_action :set_well_wisher_and_birthday_celebrant

  def wish_happy_birthday_email
    @well_wisher = params[:user]
    @birthday_celebrant = params[:birthday_buddy]

    mail(to: email_address_with_name(@well_wisher.email, @well_wisher.name), subject: "It's #{@birthday_celebrant.name.possessive} birthday today!" )
  end

  private

  # def set_well_wisher_and_birthday_celebrant
  #   @well_wisher = params[:user]
  #   @birthday_celebrant = params[:birthday_buddy]
  # end
end
