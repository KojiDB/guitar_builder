class BuildersController < ApplicationController
  before_action :authenticate_builder!, only: [:edit, :show, :update, :destroy]
  
  def index
    @builder = Builder.all
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
    params.require(:builder).permit(:brand_name, :builder_email, :builder_password, :area, :city, :introduction, :price_zone, :phone, :private_order_id)
  end
end
