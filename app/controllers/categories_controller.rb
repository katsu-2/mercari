class CategoriesController < ApplicationController

  def show
    @category_parents = Category.where(parent_id: "0")
    @category = Category.find(params[:id])
  end

end
