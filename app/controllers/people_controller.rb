class PeopleController < ApplicationController
  before_action :set_flight
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = @flight.people.build
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    require 'date'
    @person = @flight.people.build(person_params)
    available_seats = @flight.number_of_people_fit - @flight.people.count
    departed = (@flight.date - Date.today).to_i
    if available_seats > 0 
      if departed >= 0
        respond_to do |format|
          if @person.save
            format.html { redirect_to [@flight, @person], notice: 'Your ticket is booked' }
            format.json { render :show, status: :created, location: @person }
          else
            format.html { render :new }
            format.json { render json: @person.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to flight_path(@flight), notice: 'Flight has already departed'
      end
    else
      redirect_to flight_path(@flight), notice: 'Ticket cannot be booked as flight is full'
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to flight_person_path(@flight), notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to flight_path(@flight), notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    def set_flight
      @flight = Flight.find(params[:flight_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :phone_number, :email, :flight_id)
    end
end
