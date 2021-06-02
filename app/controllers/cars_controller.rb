class CarsController < ApplicationController
  before_action :set_car, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: :home

  def home
    @cars = policy_scope(Car).order(created_at: :desc)
  end

  def show
    @rent = Rent.new(car: @car)
  end

  def new
    @car = Car.new
    authorize @car
  end

 def create
    @car = Car.new(car_params)
    @car.user = current_user
    authorize @car
    if @car.save
      redirect_to root_path, notice: "car created"
    else
      render :new
    end
  end

  def destroy
    @car.destroy
    redirect_to root_path
  end

  private

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end

  def car_params
    params.require(:car).permit(:model, :year, :km, :location, :picture )
  end
end
