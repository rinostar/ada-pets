class Pet < ActiveRecord::Base
  def self.search(query)
    Pet.all.select do |pet|
      pet.name.downcase.include? query.downcase
    end
  end
end
