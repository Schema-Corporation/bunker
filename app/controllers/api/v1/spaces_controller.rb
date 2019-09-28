module Api 
  module V1 
    class SpacesController < ApplicationController

      before_action :authenticate_user!

        # GET /spaces
      def index
        @spaces = Space.all
        render json: @spaces,status: :ok

        rescue ActiveRecord::RecordNotFound
            render json: [],status: :not_found
      end

      def lessors
        @spaces = Lessor.find(params[:id]).spaces
        render json: @spaces,status: :ok

        rescue ActiveRecord::RecordNotFound
            render json: [],status: :not_found
      end

      def first_photo
        @allPhotos = Photo.all
        @photos = Array.new
        @allPhotos.each do |photo|
            if photo.space.id == Space.find(params[:id]).id
                @photos.push(photo)
            end
        end
        render json: @photos.first, status: :ok

        rescue ActiveRecord::RecordNotFound
            render json: [],status: :not_found
      end

      # GET /spaces/1
      def show
        @space = Space.find(params[:id])
        if @space != nil 
            render json: @space, status: :ok
        end 

        rescue ActiveRecord::RecordNotFound
            render json: [],status: :not_found
      end

      # POST /spaces
      def create
        @lessor = Lessor.find(params[:lessor][:id])

        @space = Space.new(
          lessor_id: @lessor.id, 
          status: params[:status], 
          width: params[:width], 
          height: params[:height], 
          area: params[:area], 
          rent_price: params[:rent_price], 
          space_type: params[:space_type],
          description: params[:description]
          )
        if @space.save
            render json: @space, adapter: :attributes, status: :created
        end

        rescue ActiveRecord::RecordInvalid
            render json: [],status: :unprocessable_entity

        rescue ActionController::ParameterMissing
            render json: [],status: :bad_request
        
        rescue ActiveRecord::RecordNotFound
            render json: [],status: :not_found
      end

      # PATCH/PUT /spaces/1
      def update
        @lessor = Lessor.find(params[:lessor][:id])
        @space = Space.find(params[:id])
        if @space.update(
          lessor_id: @lessor.id, 
          status: params[:status], 
          width: params[:width], 
          height: params[:height], 
          area: params[:area], 
          rent_price: params[:rent_price], 
          space_type: params[:space_type],
          description: params[:description]
          )
            render json: @space, status: :ok
        end

        rescue ActiveRecord::RecordNotFound
            render json: [], status: :not_found

        rescue ActionController::ParameterMissing
            render json: [], status: :bad_request
      end

      # DELETE /spaces/1
      def destroy
        @space = Space.find(params[:id])
        if @space.destroy
            render json: @space, status: :ok
        end

        rescue ActiveRecord::RecordInvalid
            render json: [],status: :not_found
      end

      private
      def space_params
        params.require(:space).permit(
          :status,
          :width,
          :height,
          :area,
          :rent_price,
          :space_type,
          :description,
          lessor: [:id, :user_id, :ruc, :commercial_name, :first_name, :last_name, :doc_type, :doc_number, :phone, :email, :created_at, :updated_at]
        )
      end

    end
  end
end
