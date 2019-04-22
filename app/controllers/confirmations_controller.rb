class ConfirmationsController < ApplicationController
  require 'payjp'

  def show
    @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    Payjp.api_kei = 'PAYJP_PRIVATE_KEY'
    charge = Payjp::Charge.create(amount: 3000, card: params['payjp-token'], currency: 'jpy')
  end
end
