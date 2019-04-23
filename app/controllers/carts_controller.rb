class CartsController < ApplicationController
  require 'payjp'
  Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']

  def new
    @item = Item.find(params[:item_id])
  end

  def create
    token = Payjp::Token.retrieve()
  end
end
