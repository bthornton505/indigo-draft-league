class TeamsController < ApplicationController

  def index 
    teams = Team.where(league_id: params[:league_id])
    render json: TeamSerializer.new(teams).serializable_hash.to_json
  end

  def create
    team = Team.new(team_params)

    if team.valid?
      team.save
      render json: TeamSerializer.new(team).serializable_hash.to_json
    else
      raise "There was a problem creating your team. Details: #{team.errors.full_messages[0]}"
    end

  rescue StandardError => e
    render json: { error: e }
  end

  def show 
    team = Team.find(params[:id])
    render json: TeamSerializer.new(team).serializable_hash.to_json 
  end

  def update 
    team = Team.find(params[:id])

    team.update(team_params)
    render json: TeamSerializer.new(team).serializable_hash.to_json
  end 

  private 

  def team_params 
    params.require(:team).permit(
      :trainer_id,
      :league_id,
      :name,
      :wins,
      :losses
    )
  end 
end
