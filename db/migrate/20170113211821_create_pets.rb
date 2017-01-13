class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :human

      t.timestamps
    end
  end
end
