module Api 
    module V1 
        class PhotosController < ApplicationController

            before_action :authenticate_user!
            
            def index
                @photos = Photo.all
                render json: @photos, status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            def show
                @photo = Photo.find(params[:id])
                if @photo != nil 
                    render json: @photo, status: :ok
                end 

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end


            def create
                @space = Space.find(params[:space][:id])

                @photo = Photo.new(
                    space_id: @space.id, 
                    photo_url: params[:photo_url]
                    )
                if @photo.save
                    render json: @photo, adapter: :attributes, status: :created
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

                @photo = Photo.find(params[:id])
                if @photo.update(space_id: @space.id, photo_url: params[:photo_url])
                    render json: @photo, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found

                rescue ActionController::ParameterMissing
                    render json: [], status: :bad_request
            end


            def destroy
                @photo = Photo.find(params[:id])
                if @photo.destroy
                    render json: @photo, status: :ok
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :not_found
            end

            private 
            def photo_params
              params.require(:photo).permit(
                  :space_id, 
                  :photo_url,
                  space: [:id, :lessee_id, :status, :width, :height, :area, :created_at, :updated_at, :rent_price]
                )
            end

        end
    end
end
