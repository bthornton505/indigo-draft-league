require 'swagger_helper'

RSpec.describe 'Trainers::RegistrationsController', type: :request do

  path '/sign_up' do 

    post 'Creates a new Trainer profile' do 
      tags 'Trainers'
      consumes 'application/json'
      parameter name: :trainer, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '200', 'Successfull Registration' do 
        let(:trainer) {{ 
          first_name: 'Michael', 
          last_name: 'Scott', 
          email: 'michael@dundermifflin.com', 
          password: 'greatscott' 
        }}
        run_test!
      end 

      response '401', 'invalid request' do 
        let(:trainer) {{ first_name: 'Dwight', last_name: 'Schrute' }}
        run_test!
      end 
    end 
  end 
end
