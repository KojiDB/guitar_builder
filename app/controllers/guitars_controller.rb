class GuitarsController < ApplicationController
  before_action :authenticate_builder!, only: [:new, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [:show]
  before_action :find_guitar, only: [:show, :edit, :update, :destroy]

  def index
    @guitars = Guitars.all
  end

  def new
    @guitar = Guitar.new
  end

  def create
    @guitar = Guitar.new(guitar_params)
    if @guitar.valid?
      @guitar.save
      redirect_to
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @guitar.update(guitar_params)
      redirect_to guitar_path
    else
      render :edit
    end
  end

  def destroy
    @guitar.destroy
    redirect_to 
  end

  private

  def guitar_params
    params.require(:guitar).permit(:guitar_name, :guitar_type_id, :strings_number_id, :price, :features, :url).merge(builder_id: current_builder.id)
  end

  def find_guitar
    @guitar = Guitar.find(params[:id])
  end
end
