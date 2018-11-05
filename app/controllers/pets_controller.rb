class PetsController < ApplicationController
  def index
    pets = Pet.all
    # render json: {want_some_pie: true}

    # render json: pets
    render json: pets.as_json(only: [:id, :name, :age, :human] ), status: :ok
    # render json: pets.as_json( except: [:created_at, :updated_at] )
  end

  def show
    pet = Pet.find_by(id: params[:id])

    if pet.nil?
      render json: { ok: false, message: 'not found' },
          status: :not_found
    else
      render json: {
        ok: true,
        pet: pet.as_json(except: [:created_at, :updated_at])
      }, status: :ok
    end
  end

  def create
    pet = Pet.new(pet_params)

    if pet.save
      render json: {
        ok: true,
        pet:  pet.as_json(except: [:created_at, :updated_at])
      }, status: :ok
    else
      render json: {
        ok: false,
        message: pet.errors.messages
      }, status: :bad_request

    end
  end










  private

  def pet_params
    params.require(:pet).permit(:name, :age, :human)
  end
end
