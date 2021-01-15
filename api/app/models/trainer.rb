class Trainer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :recoverable, :rememberable, :validatable, :jwt_authenticatable , jwt_revocation_strategy: JwtDenylist
  devise :database_authenticatable, :registerable

  def generate_jwt 
    JWT.encode({ id: id, exp: 1.days.from_now.to_i }, ENV['DEVISE_JWT_SECRET_KEY'], 'HS256')
  end 
end
