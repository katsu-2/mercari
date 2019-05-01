class UsersController < ApplicationController

  def show
    @category_parents = Category.where(parent_id: "0")
    @user = User.find(params[:id])
  end

end
