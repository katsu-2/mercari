class ItemsController < ApplicationController


  def index


  end

  def show
  end

  def new
    @item = Item.new
    @category = Category.where(parent_id: "0")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :size, :condition, :delivery_fee, :delivery_date, :delivery_area, :delivery_way, :price, :status, images: []).merge(user_id: "1")
    end


end
