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

  # Pet data from the user looks like
  # { "pet": {"name": "fido", "age": 3, "human": "ada"}}
  def create
    logger.info(">>>>> DPR: #{request.body.read}")
    logger.info(">>>>> DPR: #{params}")
    pet = Pet.new(pet_params)
    pet.save
    render json: { "id": pet.id }, status: :created
  end

private
  def pet_params
    params.require(:pet).permit(:name, :age, :human)
  end
end
