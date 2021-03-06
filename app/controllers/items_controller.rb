class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  
  def new
    @item =Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.order("created_at DESC")
  end

  def show
  end

  def update
    if @item.update(item_params)
       redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else 
      render :edit
    end
  end
 
 
  private
  
  def item_params
    params.require(:item).permit(:name,:item_detail,:price,:category_id,:status_id,:ship_fee_id,:prefecture_id,:ship_schedule_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item=Item.find(params[:id])
  end

end
