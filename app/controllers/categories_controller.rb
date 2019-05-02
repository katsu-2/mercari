class CategoriesController < ApplicationController
  before_action :pick_up_items, only: :show

  def show
    @category_parents = Category.where(parent_id: "0")
    @category = Category.find(params[:id])
  end

  private
    def pick_up_items
      @items = []
      @selected_category = Category.find(params[:id])

      if @selected_category.children.empty?
        @items << Item.where(category_id: @selected_category.id)
      else
        @category_children = @selected_category.children
        @category_children.each do |category_child|
          if category_child.children.empty?
            @items << Item.where(category_id: category_child.id)
          else
            @category_grand_children = category_child.children
            @category_grand_children.each do |category_grand_child|
              @items << Item.where(category_id: category_grand_child.id)
            end
          end
        end
      end
    end
end
