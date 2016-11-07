class PetsController < ApplicationController
  def index
    pets = Pet.all
    render json: pets, only: [:age, :id, :human, :name]
  end

  def show
    pet = Pet.find_by(id: params[:id])
    if pet
      render json: pet, only: [:age, :id, :human, :name]
    else
      render status: :not_found, nothing: true
    end
  end

  def search
    pets = Pet.search(params[:query])
    render json: pets, only: [:age, :id, :human, :name]
  end
end
