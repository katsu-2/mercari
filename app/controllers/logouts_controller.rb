class LogoutsController < ApplicationController
  def index
    @category_parents = Category.where(parent_id: "0")
  end
end
