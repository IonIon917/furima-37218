class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @address_purchase = AddressPurchase.new
  end


  
  def create
    @item = Item.find(params[:item_id])
    @address_purchase = AddressPurchase.new (purchase_params)
    if @address_purchase.valid?
      pay_item
      @address_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:address_purchase).permit(:post_code, :city, :building, :tell, :house_number, :ship_from_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token] )
  end

  def pay_item
    Payjp.api_key = "sk_test_e4304c8864e6cbd3063bb210"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.item_value,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'
    )
    end

end
