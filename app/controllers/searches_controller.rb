class SearchesController < ApplicationController
  def index
    @category_parents = Category.where(parent_id: "0")
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
  end

  def create
  end
end
