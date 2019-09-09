module Api 
  module V1 
    class SpacesController < ApplicationController

        # GET /spaces
      def index
        @spaces = Space.all
        render json: @spaces,status: :ok

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
        @space = Service.new(space_params)
        if @space.save
            render json: @space, status: :created
        end

        rescue ActiveRecord::RecordInvalid
            render json: [],status: :unprocessable_entity

        rescue ActionController::ParameterMissing
            render json: [],status: :bad_request
      end

      # PATCH/PUT /spaces/1
      def update
        @space = Service.find(params[:id])
        if @space.update(space_params)
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


    end
  end
end
