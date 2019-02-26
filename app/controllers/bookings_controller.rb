class BookingsController < ApplicationController
  def new
    @kitten = Kitten.find(params[:kitten_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(booking_params)
    @booking.kitten = Kitten.find(params[:kitten_id])
    @booking.user = current_user
    if @booking.save
      redirect_to kitten_path(@kitten)
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
