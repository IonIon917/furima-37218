class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @address_purchase = AddressPurchase.new
  end


  
  def create
    @item = Item.find(params[:item_id])
    @address_purchase = AddressPurchase.new (purchase_params)
    if @address_purchase.valid?
      @address_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:address_purchase).permit(:post_code, :city, :building, :tell, :house_number, :ship_from_id).merge(user_id: current_user.id, item_id: @item.id)
  end

end
