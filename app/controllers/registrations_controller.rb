class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save
      render json: resource, status: :created
    else
      render json: { message: resource.errors, status: :error }
    end
  end
end