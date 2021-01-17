require 'swagger_helper'

RSpec.describe 'Trainers::SessionsController', type: :request do
  path '/login' do 

    post 'Logs in a Trainer' do 
      tags 'Trainers'
      consumes 'application/json'
      parameter name: :trainer, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '200', 'Successful Login' do 
        let(:trainer) {{ 
          first_name: 'Michael', 
          last_name: 'Scott', 
          email: 'michael@dundermifflin.com', 
          password: 'greatscott' 
        }}
        run_test!
      end 

      response '401', 'invalid request' do 
        let(:trainer) {{ email: '', password: '' }}
        run_test!
      end 
    end 
  end 
end
