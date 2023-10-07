class OrdersController < ApplicationController
  before_action :sold

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :city, :address, :building_name, :tel_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def sold
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
  end

end
