class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
  end


  def new
    @item =Item.new
    if current_user
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  
  def item_params
    params.require(:item).permit(:user,:name,:item_detail,:price,:category_id,:status_id,:ship_fee_id,:prefecture_id,:ship_schedule_id, :image).merge(user_id: current_user.id)
  end

end
