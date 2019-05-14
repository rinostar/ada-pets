class PetsController < ApplicationController
  def index
    pets = Pet.all
    render json: pets.as_json(only: [:id, :name, :age, :human]),
           status: :ok
  end

  def show
    pet = Pet.find_by(id: params[:id])

    if !pet.nil?
      render json: pet.as_json(only: [:id, :name, :human, :age]),
             status: :ok
    else
      render json: { ok: false, messages: ["Pet not found"] },
             status: :not_found
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :human)
  end
end
