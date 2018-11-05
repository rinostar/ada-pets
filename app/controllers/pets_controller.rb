class PetsController < ApplicationController
  def index
    pets = Pet.all
    # render json: {want_some_pie: true}

    # render json: pets
    render json: pets.as_json(only: [:id, :name, :age, :human] ), status: :ok
    # render json: pets.as_json( except: [:created_at, :updated_at] )

  end



  private

  def pet_params
    params.require(:pet).permit(:name, :age, :human)
  end
end
