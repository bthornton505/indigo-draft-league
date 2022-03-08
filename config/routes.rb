Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :trainers, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'sign_up'
  },
  controllers: {
    sessions: 'trainers/sessions',
    registrations: 'trainers/registrations'
  }

  resources :trainers
  resources :team_memberships

  resources :leagues do 
    resources :league_settings
    resources :teams
  end 
end

# /trainer/:trainer_id/leagues <-- this could be part of home page when trainer logs in

# /leagues/:league_id/teams/:team_id
# /leagues/:league_id/teams

# /trainer/:trainer_id/teams
# /trainer/:trainer_id/teams/:team_id