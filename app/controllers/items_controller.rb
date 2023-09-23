class ItemsController < ApplicationController
  before_action :move_to_login,  only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      else
        # binding.pry
        render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_login
    authenticate_user!
  end

end
