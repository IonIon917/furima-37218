class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  def index
    if @item.purchase.present? && current_user.id == @item.user_id
      redirect_to root_path
    else
      @address_purchase = AddressPurchase.new (purchase_params)
      if @address_purchase.valid?
        pay_item
        @address_purchase.save
        redirect_to root_path
      else
        render :index
      end
    end

  end


  
  def create

  end

  private
  def purchase_params
    params.require(:address_purchase).permit(:post_code, :city, :building, :tell, :house_number, :ship_from_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token] )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_value,  
      card: purchase_params[:token],    
      currency: 'jpy'
    )
  end


end
