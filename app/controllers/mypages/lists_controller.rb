class Mypages::ListsController < ApplicationController
  before_action :authenticate_user!

  def show
    @category_parents = Category.where(parent_id: "0")
    @items = Item.where(user_id: current_user.id)
  end
end
