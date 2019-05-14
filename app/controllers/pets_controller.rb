class PetsController < ApplicationController
  def index
    pets = Pet.all
    render json: pets.as_json(only: [:id, :name, :age, :human]),
           # render json: { ok: true, pet: pets.as_json(only: [:id, :name, :age, :human])},
           status: :ok
  end

  def show
    pet = Pet.find_by(id: params[:id])

    if !pet.nil?
      render json: pet.as_json(only: [:id, :name, :human, :age]),
             status: :ok
    else
      render json: { ok: false, errors: { pet: ["Pet not found"] } },
             status: :not_found
    end
  end

  def create
    pet = Pet.new(pet_params)

    if pet.save
      render json: pet.as_json(only: [:name, :age, :human, :id]),
             status: :ok
    else
      render json: { ok: false, errors: pet.errors.messages },
             status: :bad_request
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :human)
  end
end

# {
#   pet: {
#     name: "Bob",
#     age: 99,
#     human: "Robert"
#   }
# }
