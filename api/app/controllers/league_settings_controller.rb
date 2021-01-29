class LeagueSettingsController < ApplicationController
  before_action :set_league_settings, only: [:show, :update]

  def create 
    league_settings = LeagueSetting.new(league_settings_params)

    if league_settings.valid?
      league_settings.save 
    else 
      raise "There was a problem saving your settings. Please try again."
    end 

    render json: LeagueSettingSerializer.new(league_settings).serializable_hash.to_json

  rescue StandardError => e 
    render json: { error: e }
  end 

  def show 
    render json: LeagueSettingSerializer.new(@league_settings).serializable_hash.to_json
  end  

  def update 
    @league_settings.update(league_settings_params)

    render json: LeagueSettingSerializer.new(@league_settings).serializable_hash.to_json
  
  rescue StandardError => e 
    render json: { error: e }
  end 

  private 

  def league_settings_params 
    params.require(:league_settings).permit(
      :league_id,
      :format,
      :number_of_matchups_a_week,
      :number_of_teams,
      :number_of_playoff_teams,
      :ev_training_allowed,
      :iv_training_allowed,
      :duplicate_pokemon_allowed,
      :evolution_line_allowed,
      :repeat_items_allowed,
      :weeks_in_a_season,
      :trading_allowed,
      :flex_position_budget
    )
  end 

  def set_league_settings 
    @league_settings = LeagueSetting.find_by(league_id: params[:league_id])
  end 
end
