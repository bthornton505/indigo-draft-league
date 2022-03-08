class TeamMembershipsController < ApplicationController
  def index 
    team_memberships = TeamMemberships.where(trainer_id: current_user.id)
    render json: TeamMembershipSerializer.new(team_memberships).serializable_hash.to_json
  end

  def create
    team_membership = TeamMemberships.new(team_membeship_params)

    if team_membership.valid?
      team_membership.save
      render json: TeamMembershipSerializer.new(team_membership).serializable_hash.to_json
    else
      raise "There was a problem creating your team membership. Details: #{team_membership.errors.full_messages[0]}"
    end

  rescue StandardError => e
    render json: { error: e }
  end

  def show 
    team_membership = TeamMemberships.find(params[:id])
    render json: TeamMembershipSerializer.new(team_membership).serializable_hash.to_json 
  end

  def update 
    team_membership = TeamMemberships.find(params[:id])

    team_membership.update(team_membeship_params)
    render json: TeamMembershipSerializer.new(team_membership).serializable_hash.to_json
  end 

  private 

  def team_membeship_params 
    params.permit(
      :trainer_id,
      :pokemon_id,
      :kills,
      :deaths,
      :tier
    )
  end 
end
