class PetsController < ApplicationController
  def index
    @pets = Pet.all
    # render json: pets.as_json(only: [:id, :name, :age, :human ]), status: :ok
  end

  def show
    pet = Pet.find_by(id: params[:id])

    if pet
      render json: pet.as_json(only: [:id, :name, :age, :human]), status: :ok
    else
      render json: { ok: false }, status: :not_found
    end
  end

  def create
    pet = Pet.create(pet_params)

    if pet.id
      render json: { ok: true, id: pet.id }, status: :ok
    else
      render json: { ok: false, errors: pet.errors.messages }, status: :bad_request
    end
  end

  private

    def pet_params
      return params.require(:pet).permit(:name, :age, :human)
    end
end
