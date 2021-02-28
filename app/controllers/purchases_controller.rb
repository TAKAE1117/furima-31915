class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end
  
  # def create
  #   binding.pry
  # #   @purchase_address = PurchaseAddress.new(purchase_address_params)
  # #   if @purchase_address.valid?
  # #     @purchase_address.save
  # #     redirect_to action: :index
  # #   else
  # #     render action: :new
  # #   end
  # end

  # private

  # def purchase_address_params
  #   params.require(:PurchaseAddress).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number)
  # end

end