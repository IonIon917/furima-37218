class ItemsController < ApplicationController
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
    params.require(:item).permit(:introduction, :item_name, :category_id, :status_id, :ship_from_id, :item_value, :delivery_charge_id, :days_to_ship_id ).merge(user_id: current_user.id)
  end
end
