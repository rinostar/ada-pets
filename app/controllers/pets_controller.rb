class PetsController < ApplicationController
  def index
    pets = Pet.all
    render(json: pets.as_json(only: [:age, :human, :id, :name]), status: :ok)
  end

  def show
    @pet = Pet.find_by(id: params[:id])
    if @pet.nil?
      render json: {
        errors: {
          id: ["No pet with ID #{params[:id]}"]
        }
      }, status: :not_found
    else
      render 'pets/show'
    end
  end

  def create
    pet = Pet.new(pet_params)
    if pet.save
      # Success
      render json: { id: pet.id }, status: :created
    else
      # Failure
      render json: { errors: pet.errors.messages }, status: :bad_request
    end
  end

  private
  def pet_params
    return params.require(:pet).permit(:name, :age, :human)
  end
end
