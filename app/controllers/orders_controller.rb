class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :exhibition_confirmation

  def index
    @order_record = OrderRecord.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_record = OrderRecord.new(order_params)
    if @order_record.valid?
      pay_item
      @order_record.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_record).permit(:postal, :prefecture_id, :municipalities, :address, :building, :phone, :record_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def exhibition_confirmation
    if @item.record.present?
      redirect_to root_path
    end
  end
end
