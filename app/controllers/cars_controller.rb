class CarsController < ApplicationController
  before_action :set_car, only: [:show]

  def home
    @car = Car.all
  end

  def show
    @rent = Rent.new(car: @car)
  end

  def new
    @car = Car.new
  end



  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end




  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :year, :km, :picture, :location)
  end
end
