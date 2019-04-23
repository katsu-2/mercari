class ItemsController < ApplicationController


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

  def upload_image
    @image_blob = create_blob(params[:image])
    respond_to do |format|
      format.json { @image_blob.id }
    end
  end

  def get_category_id
    @category_parent = Category.find(params[:category_id])
    @category_children =  @category_parent.children
    respond_to do |format|
      format.json { @category_children }
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :size, :condition, :delivery_fee, :delivery_date, :delivery_area, :delivery_way, :price, :status, :category_id).merge(user_id: User.first.id, images: uploaded_images)
    end

    def create_blob(uploading_file)
      ActiveStorage::Blob.create_after_upload! \
        io: uploading_file.open,
        filename: uploading_file.original_filename,
        content_type: uploading_file.content_type
    end

    def uploaded_images
      params[:item][:images].map{|id| ActiveStorage::Blob.find(id)} if params[:item][:images]
    end

end
