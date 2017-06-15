# class Users::RegistrationsController < Devise::RegistrationsController
#   def create
#     super
#     UserMailer.registration_confirmation(resource).deliver unless resource.invalid?
#   end
# end
