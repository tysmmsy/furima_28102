class OrdersController < ApplicationController
  before_action :check_item, only: :index
  before_action :move_to_index, only: :index

  def index
    
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    @order.save
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

  private

  def order_address
    params.require(:order_address).permit(:item,
                                          :postal_code,
                                          :shipping_region,
                                          :city,
                                          :house_number,
                                          :building_name,
                                          :phone_number,
                                         )
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def check_item
    @item = Item.find(params[:item_id])
  end

end
