class LeaguesController < ApplicationController

  def index 
    leagues = League.all

    render json: LeagueSerializer.new(leagues).serializable_hash.to_json
  end 

  def create 
    league = League.new(league_params)

    if league.valid?
      league.save
      league.trainers << current_user
      league.add_league_owner(current_user)

      render json: LeagueSerializer.new(league).serializable_hash.to_json
    else 
      raise "There was a problem making changes to your league. Details: #{league.errors.full_messages[0]}"
    end 

  rescue StandardError => e 
    render json: { error: e }
  end 

  def show 
    league = League.find(params[:id])
    render json: LeagueSerializer.new(league).serializable_hash.to_json
  end 

  def update 
    league = League.find(params[:id])
    
    if !league.valid?
      raise "There was a problem making changes to your league. Details: #{league.errors.full_messages}"
    end  
      
    league.update(league_params)
    render json: LeagueSerializer.new(league).serializable_hash.to_json

  rescue StandardError => e 
    render json: { error: e }
  end 

  private 

  def league_params
    params.permit(:name, :trainer_id)
  end 
end
