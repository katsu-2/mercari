class Mypages::RegistrationsController < ApplicationController
  before_action :authenticate_user!
  def new;end
end
