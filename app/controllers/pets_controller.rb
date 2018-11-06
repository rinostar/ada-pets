class PetsController < ApplicationController
  def index
    pets = Pet.all
    # render json: {want_some_pie: true}

    # render json: pets
    render json: jsonify(pets), status: :ok
    # render json: pets.as_json( except: [:created_at, :updated_at] )

  end

  def show
    pet = Pet.find_by(id: params[:id])
    if pet
      render json: jsonify(pet)
    else
      # head :not_found
      # render json: {}, status: :not_found
      render_error(:not_found, { pet_id: ["no such pet"] })
    end
  end

  def create
    pet = Pet.new(pet_params)
    if pet.save
      render json: { id: pet.id }
    else
      render_error(:bad_request, pet.errors.messages)
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :human)
  end

  def jsonify(pet_data)
    return pet_data.as_json(only: [:id, :name, :age, :human] )
  end
end
