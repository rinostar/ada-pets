class PetSerializer < ActiveModel::Serializer
  attributes :id, :age, :human, :name
end
