class Flight < ApplicationRecord
    has_many :people, dependent: :destroy
    validates :date, :presence => true
    validates :destination, :presence => true
    validates :number_of_people_fit, :presence => true
end