class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def restaurant_params
  	params.require(:restaurant).permit(:name)
  end

  def redirect_to_homepage
    redirect_to '/restaurants'
  end

  def index
    @restaurants = Restaurant.all
    if user_signed_in?
      @user_id = current_user.id
    else
      @user_id = nil
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
  	@restaurant = Restaurant.find(params[:id])
    if @restaurant.user_id == current_user.id
    	@restaurant.update(restaurant_params)
    	redirect_to_homepage
    else
      flash[:notice] = "You cannot edit a restaurant you haven't created"
      redirect_to_homepage
    end
  end

  def destroy
  	@restaurant = Restaurant.find(params[:id])
    if @restaurant.user_id == current_user.id
    	@restaurant.destroy
    	flash[:notice] = 'Restaurant deleted successfully'
    	redirect_to_homepage
    else
      flash[:notice] = "You cannot deltete a restaurant you haven't created"
      redirect_to_homepage
    end
  end

end
