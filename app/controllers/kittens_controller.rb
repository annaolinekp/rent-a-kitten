class KittensController < ApplicationController
  before_action :find_kitten, only: [:show, :destroy, :edit, :update]

  def index
    @kittens = Kitten.all
  end

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
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
    params.require(:kitten).permit(:name, :description)
  end

  def find_kitten
    @kitten = Kitten.find(params[:id])
  end
end
