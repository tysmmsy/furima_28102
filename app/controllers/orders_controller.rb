class OrdersController < ApplicationController
  def index
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    @order.save

    private
    params.require(:order_address).permit(:item,
                                          :postal_code,
                                          :shipping_region,
                                          :city,
                                          :house_number,
                                          :building_name,
                                          :phone_number,
                                         )
  end

end
