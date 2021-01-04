class OrdersController < ApplicationController
  before_action :set_order

  def index
    @order_record = OrderRecord.new
  end

  def create
    @order_record = OrderRecord.new(order_params)
    if @order_record.valid?
      @order_record.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_record).permit(:postal, :prefecture_id, :municipalities, :address, :building, :phone, :record_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
