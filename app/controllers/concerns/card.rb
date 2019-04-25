module Card
  def create_customer
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.create(
      card: params['payjp-token']
    )
  end

  def create_charge(price)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer_id = Credit.find_by(user_id: current_user.id).customer_id
    Payjp::Charge.create(
      amount:   price,
      customer: customer_id,
      currency: 'jpy',
    )
  end
end
