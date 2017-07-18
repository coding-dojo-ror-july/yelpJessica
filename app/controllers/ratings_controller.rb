class RatingsController < ApplicationController
    def new
        @user = User.find(session[:user_id])
        @restaurant = Restaurant.find(params[:id])
        render 'new'
    end    
    def create
        rating = Rating.where(restaurant: Restaurant.find(params[:id]), user: User.find(params[:user_id])).first
        if rating.nil?
            new = Rating.new(stars:params[:stars].to_i, restaurant: Restaurant.find(params[:id]), user: User.find(params[:user_id])) 
            if new.save
                redirect_to '/restaurants/show'
            else 
                flash[:errors] = new.errors.full_messages
                redirect_to "/restaurants/#{ params[:id] }/ratings/new"
            end
        else
            rating.update(stars:params[:stars])
            redirect_to "/restaurants/show"
        end
    end
end
