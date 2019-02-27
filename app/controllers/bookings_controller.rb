class BookingsController < ApplicationController
  def new
    @kitten = Kitten.find(params[:kitten_id])
    @booking = Booking.new
  end

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find_by(user: current_user)
    @kitten = @booking.kitten
  end

  def create
    @kitten = Kitten.find(params[:kitten_id])
    @booking = Booking.create(booking_params)
    @booking.kitten = @kitten
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
