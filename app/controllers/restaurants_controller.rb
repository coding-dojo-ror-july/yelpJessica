class RestaurantsController < ApplicationController
    def show
        @restaurants = Restaurant.all 
        render 'show'
    end     
    def new
        render 'new'
    end 
    def create
        restaurant = Restaurant.new(restaurant_params)
        if restaurant.save
            redirect_to '/restaurants/show'
        else 
            flash[:errors]=restaurant.errors.full_messages
            redirect_to '/restaurants/new'
        end
    end   
    private
        def restaurant_params
            params.require(:restaurant).permit(:name)   
        end                
end
