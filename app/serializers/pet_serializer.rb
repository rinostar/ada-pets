class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :human, :species
end
