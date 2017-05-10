class PetsController < ApplicationController
  def index
    pets = Pet.all
    render :json => pets, status: :ok
  end

  def show
    pet = Pet.find_by(id: params[:id])
    if pet
      render :json => pet, status: :ok
    else
      render :json => pet, status: :not_found
    end
  end


  def create
    pet = Pet.new(pet_params)
    if pet.save
      render status: :ok, json: { id: pet.id }
    else
      render status: :bad_request, json: { errors: pet.errors.messages }
    end
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :age, :person_id)
  end

end
