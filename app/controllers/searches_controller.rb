class SearchesController < ApplicationController
  def index
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
    @search_items = Item.where('name LIKE(?)', "%#{params[:search]}%").limit(40)
  end

  def search

  end


  def create
  end
end



