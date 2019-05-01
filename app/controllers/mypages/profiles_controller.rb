class Mypages::ProfilesController < ApplicationController

  def show
    @category_parents = Category.where(parent_id: "0")
  end
end
