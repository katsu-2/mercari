class SearchesController < ApplicationController
  before_action :set_category, only: :index

  def index
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
    # @category = Category.where(parent_id: "0")

    # binding.pry
  end

  # def create
  #   @search = Item.ransack(search_params)
  #   @items = @search.result(distinct: true)
  # end

  def get_category
    @category_parent = Category.find(params[:category_id])
    @category_children =  @category_parent.children
    respond_to do |format|
      format.json { @category_children }
    end
  end

  private
  def search_params
    params.require(:q).permit(:name_cont, :price_eq, :price_gteq, :price_lteq)
  end

  def set_category
    @category = Category.all
  end
end
