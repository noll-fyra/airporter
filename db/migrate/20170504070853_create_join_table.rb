class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :flights, :users do |t|
      # t.index [:flight_id, :user_id]
      # t.index [:user_id, :flight_id]
    end
  end
end
