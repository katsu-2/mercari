class Mypages::CreditsController < ApplicationController
  require 'payjp'
  Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']

  def new
  end

  def create
    #顧客を作成
    customer = Payjp::Customer.create(card: params['payjp-token'])

    #カードトークンを用いて支払いを作成。
    # charge = Payjp::Charge.create(
    #   amount:    3500,
    #   customer:  customer,
    #   currency:  'jpy'
    # )
  end
end
