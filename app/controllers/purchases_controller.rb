class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :create_if

  def index
    @address_purchase = AddressPurchase.new 
  end


  
  def create

    @address_purchase = AddressPurchase.new (address_purchase_params)
     if @address_purchase.valid?
       pay_item
       @address_purchase.save
       redirect_to root_path
     else
       render :index
     end

  end

  private
  def address_purchase_params
    params.require(:address_purchase).permit(:post_code, :city, :building, :tell, :house_number, :ship_from_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def create_if
    if @item.purchase.present? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_value,  
      card: address_purchase_params[:token],
      currency: 'jpy'
    )
  end


end
