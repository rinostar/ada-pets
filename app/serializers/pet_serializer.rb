class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :dog_years
  has_one :person

end
