class OrdersController < ApplicationController
  before_action :check_item, only: [:index, :create]
  before_action :move_to_index, only: :index
  before_action :item_owner_cannot_buy_own, only: :index

  def index
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.permit(:token,
                  :item_id,
                  :postal_code,
                  :shipping_region_id,
                  :city,
                  :house_number,
                  :building_name,
                  :phone_number
                  ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_owner_cannot_buy_own
    redirect_to root_path if user_signed_in? && current_user.id == @item.user.id
  end

  def check_item
    @item = Item.find(params[:item_id])
  end

end
