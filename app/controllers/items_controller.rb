class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:show, :new, :create]


  def index


  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @category = Category.where(parent_id: "0")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "商品を出品しました"
    else
      flash.now[:alert] = "商品出品に失敗しました"
      render :new
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :size, :condition, :delivery_fee, :delivery_date, :delivery_area, :delivery_way, :price, :status, images: []).merge(user_id: "1")
    end
end
