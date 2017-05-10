class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone
  has_many :pets
end
