class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :edit]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create, :edit]

  def index
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase != nil
  end

end