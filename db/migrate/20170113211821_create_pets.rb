class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.belongs_to :person

      t.timestamps
    end
  end
end
