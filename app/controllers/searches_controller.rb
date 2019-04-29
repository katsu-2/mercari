class SearchesController < ApplicationController
  def index
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
    @search_items = Item.where('title LIKE(?)', "%#{params[:keyword]}%").limit(40)
  end

  def create
  end
end



