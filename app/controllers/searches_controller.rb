class SearchesController < ApplicationController
  def index
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
    # binding.pry
  end

  def create
    @search = Item.ransack(search_params)
    @items = @search.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit(:name_cont, :price ,:price_gteq, :price_lteq, condition_ids: [])
  end
end
