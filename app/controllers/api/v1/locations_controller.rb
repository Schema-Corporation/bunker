module Api 
    module V1
        class LocationController < ApplicationController

            def index 
                @locations = Location.all 
                render json: @locations
            end

            def show
                render json: @location
            end

            
        end
    end
end
