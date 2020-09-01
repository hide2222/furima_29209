class OrdersController < ApplicationController

  def index
    @item = Item.find_by(params[:id])
  end

  def create
    @order = Order.new(price: order_params[:price])
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
    params.permit(:price,:token)
  end

  def pay_item
    Payjp.api_key = "sk_test_02d8d0973f226e54c1f5890b"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
