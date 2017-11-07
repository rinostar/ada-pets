class PetsController < ApplicationController
  def index
    pets = Pet.all

    render(
      json: pets,
      status: :ok
    )
  end

  def show
    pet = Pet.find_by(id: params[:id])

    if pet
      render json: pet, status: :ok
    else
      render json: { ok: false }, status: :not_found
    end
  end

  def create
    pet = Pet.create(pets_params)

    if pet.valid?
      render json: pet, status: :created
    else
      render json: {errors: pet.errors.messages}, status: :bad_request
    end
  end

  private

    def pets_params
      params.require(:pet).permit(:human, :name, :age)
    end







end
