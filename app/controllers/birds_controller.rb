class BirdsController < ApplicationController
  # wrap_parameters format: [] # Disable wrap parameters in individual conroller.



  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    # byebug
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end


  private
  # All methods below are private

  def bird_params
    params.permit(:name, :species)
  end

end
