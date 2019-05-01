class SearchesController < ApplicationController
  def index
    @category_parents = Category.where(parent_id: "0")
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
    @search_items = Item.where('name LIKE(?)', "%#{params[:search]}%").limit(40)
  end

  def create
  end
end



