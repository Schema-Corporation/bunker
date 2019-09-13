module Api 
    module V1
        class LocationsController < ApplicationController

            before_action :authenticate_user!

            #GET /locations
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
                @space = Space.find(params[:space][:id])
                
                @location = Location.new(space_id: @space.id, address: params[:address], latitude: params[:latitude], longitude: params[:longitude])

                if @location.save
                    render json: @location, adapter: :attributes, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end


            def update
                @space = Space.find(params[:space][:id])

                @location = Location.find(params[:id])
                if @location.update(space_id: @space.id, address: params[:address], latitude: params[:latitude], longitude: params[:longitude])
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
              params.require(:location).permit(
                  :space_id, 
                  :address, 
                  :latitude, 
                  :longitude, 
                  space: [:id, :lessee_id, :status, :width, :height, :area, :created_at, updated_at, rent_price]
                )
            end            

        end
    end
end
