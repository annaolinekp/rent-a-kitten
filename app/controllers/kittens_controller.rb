class KittensController < ApplicationController
  def index
  end
  def show
  end
  def new
  end
  def create
  end
  def edit
    authorize @kitten
  end
  def update
    authorize @kitten
  end
  def destroy
    authorize @kitten
  end
end
