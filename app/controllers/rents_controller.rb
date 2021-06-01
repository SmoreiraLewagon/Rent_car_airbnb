class RentsController < ApplicationController
  def create
    @car = Car.find(params['car_id'])
    @rent = Rent.new(rent_params)
    @rent.car_id = params['car_id']
    @rent.user = current_user
    authorize @rent
    if @rent.save
      redirect_to root_path, notice: "You rented the car"
    else
      render 'cars/show'
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:name, :date, :time, :car_id)
  end
end
