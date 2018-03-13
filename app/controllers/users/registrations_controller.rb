class Users::RegistrationsController < Devise::RegistrationsController
  def build_resorce(hash = nil)
    hash[:uid] = User.create_unique_string
    super
  end
end
