require 'rails_helper'

RSpec.describe "LeagueSettings", type: :request do
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
                league_id: { type: integer },
                format: { type: string },
                number_of_matchups_a_week: { type: integer },
                number_of_teams: { type: integer },
                number_of_playoff_teams: { type: integer },
                ev_training_allowed: { type: boolean },
                iv_training_allowed: { type: boolean },
                duplicate_pokemon_allowed: { type: boolean },
                evolution_line_allowed: { type: boolean },
                repeat_items_allowed: { type: boolean },
                weeks_in_a_season: { type: integer },
                trading_allowed: { type: boolean },
                flex_position_budget: { type: integer }
            },
            required: [ 'league_id' ]
        }

        # before do 
        #   jwt_token = JWT.encode({ id: 505, exp: 1.days.from_now.to_i }, ENV['DEVISE_JWT_SECRET_KEY'], 'HS256')
        #   auth_headers = { 'Authorization': jwt_token }
        #   request.headers.merge!(auth_headers)
        # end 

        response '200', 'Successfully create new League Settings' do 
            let(:league_settings) {{ 
                league_id: 123,
                format: "VGC",
                number_of_matchups_a_week: 1,
                number_of_teams: 10,
                number_of_playoff_teams: 8,
                ev_training_allowed: false,
                iv_training_allowed: true,
                duplicate_pokemon_allowed: false,
                evolution_line_allowed: true,
                repeat_items_allowed: false,
                weeks_in_a_season: 12,
                trading_allowed: true,
                flex_position_budget: 50
            }}
            run_test!
        end 

        response '401', 'invalid request' do 
            let(:league_settings) {{ league_id: '' }}
            run_test!
        end 
    end 
end
