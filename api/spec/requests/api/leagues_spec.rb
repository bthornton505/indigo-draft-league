require 'swagger_helper'

RSpec.describe 'LeaguesController', type: :request do
  path '/create' do 

    post 'Creates a new League' do 
      tags 'Leagues'
      consumes 'application/json'
      parameter name: :league, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: [ 'name' ]
      }

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
