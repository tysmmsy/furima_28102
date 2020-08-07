class ItemsController < ApplicationController
  before_action :check_item, only: :show
  before_action :move_to_index, except: [:index, :show, :new]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
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

  private

  def item_params
    params.require(:item).permit(:image,
                                 :name,
                                 :description,
                                 :price,
                                 :category_id,
                                 :item_condition_id,
                                 :delivery_fee_id,
                                 :shipping_region_id,
                                 :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def check_item
    @item = Item.find(params[:id])
  end
end
