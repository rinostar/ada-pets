class Pet < ApplicationRecord
  validates :name, presence: true

  def species
    return "dog"
  end
end
