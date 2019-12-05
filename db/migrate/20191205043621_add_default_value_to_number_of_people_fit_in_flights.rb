class AddDefaultValueToNumberOfPeopleFitInFlights < ActiveRecord::Migration[5.2]
  def change
    change_column :flights, :number_of_people_fit, :integer, default: 0
  end
end
