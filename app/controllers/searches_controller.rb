class SearchesController < ApplicationController
  before_action :set_category, only: :index

  def index
    @category_parents = Category.where(parent_id: "0")
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
    @search_items = Item.where('name LIKE(?)', "%#{params[:search]}%").limit(40)
  end


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



