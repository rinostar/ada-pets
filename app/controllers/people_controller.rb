class PeopleController < ApplicationController
  def index
    people = Person.all
    render :json => people, status: :ok
  end

  def show
    person = Person.find_by(id: params[:id])
    if person
      render :json => person, status: :ok
    else
      render :json => person, status: :not_found
    end
  end
end
