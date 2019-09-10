module Api 
    module V1 
        class PhotosController < ApplicationController
            
            def index
                @photos = Photo.all
                    render json: @photos,status: :ok

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
                @photo = Photo.new(photo_params)
                if @photo.save
                    render json: @photo, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
            end


            def update
                @photo = Photo.find(params[:id])
                if @photo.update(photo_params)
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
              params.require(:photo).permit(:space_id, :photo_url)
            end

        end
    end
end
