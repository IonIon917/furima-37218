class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :item_find, only: [:edit, :update, :destroy, :show]
  before_action :edit_destroy, only: [:edit, :destroy]


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
    unless @item.purchase.blank?
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

  def destroy
    @item.destroy
    redirect_to root_path

  end

  private
  def item_params
    params.require(:item).permit(:introduction, :item_name, :category_id, :status_id, :ship_from_id, :item_value, :delivery_charge_id, :days_to_ship_id, :image ).merge(user_id: current_user.id)
  end

  def item_find
      @item = Item.find(params[:id])
  end

  def edit_destroy
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end


end
