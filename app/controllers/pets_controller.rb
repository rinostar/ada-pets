class PetsController < ApplicationController
  def index
    pets = Pet.all
    render json: pets
  end

  def show
    pet = Pet.find_by(id: params[:id])
    if pet
      render json: pet
    else
      render status: :not_found, nothing: true
    end
  end

  def search
    pets = Pet.search(params[:query])
    render json: pets
  end
end
