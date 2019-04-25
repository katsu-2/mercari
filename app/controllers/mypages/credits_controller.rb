class Mypages::CreditsController < ApplicationController
  include Card

  def new
    @credit = Credit.new
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']

    if current_user.credits.present?
      flash[:notice] = "既にカードが登録されています"
      redirect_to root_path
    else
      @credit = current_user.credits.new(customer_id: create_customer.id)
      if @credit.save
        flash[:notice] = "登録しました"
        redirect_to root_path
      else
        render 'new'
      end
    end
  end
end
