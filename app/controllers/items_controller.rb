class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
  before_action :sold_edit, only: [:edit]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
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

  def sold_edit
    if @item.order.present?
      redirect_to root_path
    end
  end

end
