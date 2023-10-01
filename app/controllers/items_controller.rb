class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!,  only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    if user_signed_in?
      not_user = Item.find(params[:id])
      unless current_user == not_user.user
        redirect_to action: :index
      end
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
