class BuildersController < ApplicationController
  before_action :authenticate_builder!, only: [:edit, :show, :update, :destroy]
  
  def index
    @builder = Builder.all
  end

  def new
    @builder = Builder.new
  end

  def create
    @builder = Builder.new(builder_params)
    if @builder.valid?
      @builder.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @builder = Builder.find(params[:id])
  end

  def edit
  end

  def update
    if current_builder.update(builder_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    current_builder.destroy
    redirect_to root_path
  end

  private

  def builder_params
    params.require(:builder).permit(:brand_name, :builder_email, :builder_password, :area, :city, :introduce, :price_zone, :phone, :private_order_id)
  end
end
