class CartsController < ApplicationController
  before_action :authenticate_user!
  include Card

  before_action :set_item, only: [:new, :create]

  def new
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @cards = Credit.all
    @cart = Cart.new
    customer_id = Credit.find_by(user_id: current_user.id).customer_id if customer_id.present?
    Payjp::Customer.retrieve(customer_id) if customer_id.present?
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    create_charge(@item.price)
    @cart = @item.carts.new(user_id: current_user.id)
    @item.status = 1

    if @cart.save && @item.save
      flash[:notice] = "購入ありがとうございました。"
      redirect_to root_path
    else
      render 'new'
    end

  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
