load Rails.root.join("app", "controllers", "users", "registrations_controller.rb")

class Users::RegistrationsController < Devise::RegistrationsController
  private
  def allowed_params
    [
        :username, :email, :password, :phone_number,
        :password_confirmation, :terms_of_service, :locale,
        :redeemable_code
    ]
  end
end