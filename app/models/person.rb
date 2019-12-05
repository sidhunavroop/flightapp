class Person < ApplicationRecord
    belongs_to :flight
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, :presence => true 
    validates :phone_number, :presence => true, :numericality => true
end
