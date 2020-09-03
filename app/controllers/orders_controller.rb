class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @order = Payment.new
  end


  def create
    
    @order = Payment.new(order_params)
    if @order.valid?
      
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
 
  def order_params
    
    params.require(:payment).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone).merge(user_id:current_user.id, item_id:@item.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_02d8d0973f226e54c1f5890b"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    
    @item = Item.find(params[:item_id])
  
  end

end
