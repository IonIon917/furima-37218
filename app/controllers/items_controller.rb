class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :item_find, only: [:edit, :update, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    
  end

  def edit
    unless @item.user_id == current_user.id && @item.purchase.blank?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:introduction, :item_name, :category_id, :status_id, :ship_from_id, :item_value, :delivery_charge_id, :days_to_ship_id, :image ).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
