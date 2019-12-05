class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.integer :flight_id

      t.timestamps
    end
  end
end
