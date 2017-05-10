class Pet < ApplicationRecord
  belongs_to :person

  validates :name, presence: true

  def dog_years
    age * 7
  end
end
