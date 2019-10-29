class PetsController < ApplicationController
  def index
    render json: { ready_for_lunch: "yassss" }
  end



  private

    def pet_params
      params.require(:pet).permit(:name, :age, :human)
    end
end
