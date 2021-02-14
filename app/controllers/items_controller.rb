class ItemsController < ApplicationController

  # before_action :authenticate_user!, only: :new
  before_action :move_to_login_page, except: :index
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :state_id, :fee_id, :area_id, :day_id, :price ).merge(user_id: current_user.id)
  end

  def move_to_login_page
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
