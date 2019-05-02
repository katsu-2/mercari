class Mypages::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @category_parents = Category.where(parent_id: "0")
  end
end
