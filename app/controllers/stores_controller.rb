class StoresController < ApplicationController

  def index
    @store = current_user.store
  end 

  def new
    @store = Store.new
  end 

  def create
    store = Store.create(name: params["store"]["name"], user: current_user)
    redirect_to dashboard_index_path
  end

  def show
    @store = Store.find_by_slug!(params[:id])
    redirect_to store_items_path(@store)
  end
end
