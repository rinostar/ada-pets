class PetSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :person

end
