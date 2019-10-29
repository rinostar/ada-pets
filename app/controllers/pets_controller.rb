class PetsController < ApplicationController
  def index
    pets = Pet.all.as_json(only: [:name, :age, :human])
    render json: pets, status: :ok
  end



  private

    def pet_params
      params.require(:pet).permit(:name, :age, :human)
    end
end
