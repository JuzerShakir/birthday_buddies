class Users::RegistrationsController < Devise::RegistrationsController
  protected
  # after updating the profile
  def after_update_path_for(resource)
    birthday_buddies_path
  end
end