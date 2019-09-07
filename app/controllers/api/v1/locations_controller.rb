module Api 
    module V1
        class LocationsController < ApplicationController

            def index 
                @locations = Location.all 
                render json: @locations
            end

            def show
                render json: @location
            end


            def create
                @location = Location.new(location_params)

                if @location.save
                    render json: @location, status: :created, location: @location
                else
                    render json: @location.errors, status: :unprocessable_entity
                end
            end


            def update
                if @location.update(location_params)
                    render json: @location
                else 
                    render json: @location.errors, status: unprocessable_entity
                end
            end


            def destroy
                @location.destroy
            end

            

        end
    end
end
