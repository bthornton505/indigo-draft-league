class TrainersController < ApplicationController

  def index 
    trainers = Trainer.all
    render json: TrainerSerializer.new(trainers).serializable_hash.to_json
  end

  def create
    trainer = Trainer.new(trainer_params)

    if trainer.valid?
      trainer.save
      render json: TrainerSerializer.new(trainer).serializable_hash.to_json
    else
      raise "There was a problem creating your trainer. Details: #{trainer.errors.full_messages[0]}"
    end

  rescue StandardError => e
    render json: { error: e }
  end

  def show 
    trainer = Trainer.find(params[:id])
    render json: TrainerSerializer.new(trainer).serializable_hash.to_json 
  end

  def update 
    trainer = Trainer.find(params[:id])

    trainer.update(trainer_params)
    render json: TrainerSerializer.new(trainer).serializable_hash.to_json
  end 

  private 

  def trainer_params 
    params.permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :total_wins,
      :total_losses
    )
  end 
end
