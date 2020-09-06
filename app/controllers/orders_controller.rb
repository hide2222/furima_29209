class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_root_path
  before_action :correct_user
  before_action :redirect_to_root_path

  def index
    @order = Payment.new
  end


  def create
    @order = Payment.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
 
  def order_params
    params.require(:payment).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone).merge(user_id:current_user.id, item_id:@item.id, token:params[:token],price:@item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def move_to_root_path
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def correct_user
    if @item.user == current_user
    redirect_to root_path 
    end
  end

  def redirect_to_root_path
    @pay = Order.new
    if @pay.id.present? 
      redirect_to root_path
    end
  end

end
