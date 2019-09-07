module Api 
  module V1 
    class SpacesController < ApplicationController

        # GET /spaces
      def index
        @spaces = Space.all

        render json: @spaces
      end

      # GET /spaces/1
      def show
        render json: @space
      end

      # POST /spaces
      def create
        @space = Space.new(Space_params)

        if @space.save
          render json: @space, status: :created, location: @space
        else
          render json: @space.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /spaces/1
      def update
        if @space.update(space_params)
          render json: @space
        else
          render json: @space.errors, status: :unprocessable_entity
        end
      end

      # DELETE /spaces/1
      def destroy
        @space.destroy
      end


    end
  end
end
