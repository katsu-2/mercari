class CartsController < ApplicationController
  before_action :set_item, only: [:new, :create]
  require 'payjp'
  Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']

  def new
    @cart = Cart.new
    customer_id = Credit.find_by(user_id: current_user.id).customer_id
    customer = Payjp::Customer.retrieve(customer_id)
    # binding.pry
  end

  def create
    # customer = current_user.credit.customer_id
    @cart = @item.cart.new(user_id: current_user.id)
    customer_id = Credit.find_by(user_id: current_user.id).customer_id
    price = @item.price

    #支払いの作成
    Payjp::Charge.create(
      amount:    price,
      customer:  customer_id,
      currency:  'jpy'
    )
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  # def cart_params
  #   params.require(:cart).permit(:user_id, :item_id)
  # end
end
