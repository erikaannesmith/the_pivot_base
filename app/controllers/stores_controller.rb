class StoresController < ApplicationController

  def index
    @stores = current_user.stores
  end 

  def new
    @store = Store.new
  end 

  def create
    @category = Category.new(title: params["store"]["name"] )
    @category.save
    redirect_to dashboard_index_path
  end

  def show
    @store = Store.find_by_slug!(params[:id])
    redirect_to store_items_path(@store)
  end
end

  def update
    @store = Store.find(params[:id])
    @store.update!(status: params[:status])
    @store.save!
    redirect_back(fallback_location: root_path)
  end
end
