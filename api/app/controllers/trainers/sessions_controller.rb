# frozen_string_literal: true

class Trainers::SessionsController < Devise::SessionsController
  respond_to :json

  def create 
    trainer = Trainer.find_by_email(sign_in_params[:email])

    if trainer && trainer.valid_password?(sign_in_params[:password])
      token = trainer.generate_jwt
      respond_with({
        code: 200, message: 'Logged in successfully.', data: token
      })
    else 
      respond_with({
        code: 401, message: trainer.errors.full_messages, data: sign_in_params
      })
    end 
  end 

  private 

  def sign_in_params 
    params.require(:session).permit(:email, :password)
  end

  def respond_with(_opts = {})
    render json: {
      status: { code: _opts[:code], message: _opts[:message] },
      data: _opts[:data]
    }
  end 

  def respond_to_on_destroy
    head :ok
  end 
end
