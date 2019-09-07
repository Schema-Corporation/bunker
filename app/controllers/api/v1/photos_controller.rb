module Api 
    module V1 
        class PhotoController < ApplicationController
            
            def index 
                @photos = Photo.all 
                render json: @photos
            end

            def show
                render json: @photo
            end


            def create
                @photo = Photo.new(photo_params)

                if @photo.save
                    render json: @photo, status: :created, location: @photo
                else
                    render json: @photo.errors, status: :unprocessable_entity
                end
            end


            def update
                if @photo.update(photo_params)
                    render json: @photo
                else 
                    render json: @photo.errors, status: unprocessable_entity
                end
            end


            def destroy
                @photo.destroy
            end

        end
    end
end
