module Api 
    module V1
        class LocationsController < ApplicationController

            def index 
                @locations = Location.all
                    render json: @locations,status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            def show
                @location = Location.find(params[:id])
                if @location != nil 
                    render json: @location, status: :ok
                end 

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end


            def create
                @location = Location.new(location_params)

                if @location.save
                    render json: @location, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
            end


            def update
                @location = Location.find(params[:id])
                if @location.update(location_params)
                    render json: @location, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found

                rescue ActionController::ParameterMissing
                    render json: [], status: :bad_request
            end


            def destroy
                @location = Location.find(params[:id])
                if @location.destroy
                    render json: @location, status: :ok
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :not_found
            end

            private 
            def location_params
              params.require(:location).permit(:space, :address, :latitude, :longitude)
            end            

        end
    end
end
