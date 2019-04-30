class SearchesController < ApplicationController
  def index
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
  end

  def create
  end
end
