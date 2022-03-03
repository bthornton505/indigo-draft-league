require 'swagger_helper'

RSpec.describe 'LeaguesController', type: :request do

  let(:jwt_token) { FactoryBot.create(:trainer, email: 'ash@gmail.com').generate_jwt }
  let(:Authorization) { "Bearer #{jwt_token}" }

  path '/create' do 
    post 'Creates a new League' do 
      tags 'Leagues'
      consumes 'application/json'
      security [ bearer_auth: {} ]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :league, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: [ 'name' ]
      }

      # before do 
      #   jwt_token = JWT.encode({ id: 505, exp: 1.days.from_now.to_i }, ENV['DEVISE_JWT_SECRET_KEY'], 'HS256')
      #   auth_headers = { 'Authorization': jwt_token }
      #   request.headers.merge!(auth_headers)
      # end 

      response '200', 'Successfully create a new League' do 
        let(:league) {{ name: 'Indigo League' }}
        run_test!
      end 

      response '401', 'invalid request' do 
        let(:league) {{ name: '' }}
        run_test!
      end 
    end 
  end 
end
