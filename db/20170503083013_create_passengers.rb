class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.references :flight, foreign_key: true

      t.timestamps
    end
  end
end
