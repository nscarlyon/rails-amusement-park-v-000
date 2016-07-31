class RidesController < ApplicationController

  def new
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @ride_info = @ride.take_ride
    redirect_to user_path(@ride.user, :ride_info => @ride_info)

  end

end
