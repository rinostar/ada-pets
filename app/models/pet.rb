class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :human, presence: true
  validates :age, numericality: true
end
