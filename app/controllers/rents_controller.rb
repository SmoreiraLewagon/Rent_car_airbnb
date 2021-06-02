class RentsController < ApplicationController
  def create
    @car = Car.find(params['car_id'])
    @rent = Rent.new(rent_params)
    @rent.car_id = params['car_id']
    @rent.user = current_user
    @rent.status = false
    authorize @rent
    if @rent.save
      redirect_to car_path(@car), notice: "You rented the car"
    else
      render 'cars/show'
    end
  end

  def status
    @rent = Rent.find(params[:id]) 
    authorize @rent
    if @rent.status == false
      @rent.status = true
    else 
      @rent.status = false
    end
    @rent.save
    redirect_to car_path(@rent.car)
  end

  private

  def rent_params
    params.require(:rent).permit(:name, :date, :time, :car_id)
  end
end
