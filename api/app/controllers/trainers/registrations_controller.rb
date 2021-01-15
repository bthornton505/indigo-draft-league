# frozen_string_literal: true

class Trainers::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      token = resource.generate_jwt
      respond_with({ 
        code: 200, message: 'Logged in successfully.', data: token
      })
    else 
      respond_with({
        code: 401, message: resource.errors.full_messages, data: sign_up_params
      })
    end 
  end

  private 

  def sign_up_params 
    params.require(:registration).permit(:first_name, :last_name, :email, :password)
  end 

  def respond_with(_opts = {})
    render json: {
      status: { code: _opts[:code], message: _opts[:message] },
      data: _opts[:data]
    }
  end 
end
