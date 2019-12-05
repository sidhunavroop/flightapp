# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - ruby 2.5.1

* Rails version - Rails 5.2.4

* git clone https://github.com/sidhunavroop/flightapp.git

* bundle install

* rails db:create

* rails db:migrate

* Run rails s to start the server.

App features include

* A route to create a flight. A flight has a date, number of people who can fit on the flight, and destination

* A route to remove a flight

* A route to return all flights along with the the people on the flight

* A route to update a flights date and destination

* A route to add a person to a flight. A person has a name, phone number, and email address

* A route to remove a person from a flight

* A route to return all people along with their flight

* A route to update a users phone number and email address

Rules

* A flight has a fixed number of seats and if it is full then you should not be able to add a person

* If a flight is removed then all persons on that flight should also be removed
