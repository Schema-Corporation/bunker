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
        @lessee = Lessee.find(params[:lessee][:id])

        @space = Space.new(lessee_id: @lessee.id, status: params[:status], width: [:width], height: params[:height], area: params[:area])
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
        @lessee = Lessee.find(params[:lessee][:id])
        @space = Space.find(params[:id])
        if @space.update(lessee_id: @lessee.id, status: params[:status], width: [:width], height: params[:height], area: params[:area])
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
        params.require(:lessee).permit(
          :status,
          :width,
          :height,
          :area,
          :lessee_id,
          lessee: [:id, :user_id, :ruc, :commercial_name, :first_name, :last_name, :doc_type, :doc_number, :phone, :email, :created_at, :updated_at]
        )
      end

    end
  end
end
