class KittensController < ApplicationController
  before_action :find_kitten, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @kittens = Kitten.where.not(latitude: nil, longitude: nil)
    # @kittens = Kitten.all
    @markers = @kittens.map do |kitten|
      {
        lng: kitten.longitude,
        lat: kitten.latitude
      }
    end
    # raise
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
    @kitten.user = current_user
    if @kitten.save
      redirect_to kitten_path(@kitten)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @kitten.update(kitten_params)
    redirect_to kitten_path(@kitten)
  end

  def destroy
    @kitten.destroy
    redirect_to kitten_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :description, :photo, :location)
  end

  def find_kitten
    @kitten = Kitten.find(params[:id])
  end
end
