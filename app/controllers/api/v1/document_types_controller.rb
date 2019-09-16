module Api 
  module V1

    class DocumentTypesController < ApplicationController

      before_action :authenticate_user!

      #GET /document_types
      def index
          @document_types = DocumentType.all
          render json: @document_types, status: :ok
      end
        
      # GET /document_types/1
      def show
        @document_type = DocumentType.find(params[:id])
        if @document_type != nil 
            render json: @document_type, status: :ok
        end 

        rescue ActiveRecord::RecordNotFound
          render json: [],status: :not_found
      end

      # POST /document_types
      def create
        @document_type = DocumentType.new(document_type_params)

        if @document_type.save
          render json: @document_type, status: :created
        end

        rescue ActiveRecord::RecordInvalid
          render json: [],status: :unprocessable_entity

        rescue ActionController::ParameterMissing
          render json: [],status: :bad_request
      end


      # PATCH/PUT /document_types/1
      def update
        @document_type = DocumentType.find(params[:id])
        if @document_type.update(document_type_params)
          render json: @document_type
        else
          render json: @document_type.errors, status: :unprocessable_entity
        end

        rescue ActiveRecord::RecordNotFound
          render json: [],status: :not_found

        rescue ActionController::ParameterMissing
          render json: [],status: :bad_request
      end

      # DELETE /document_types/1
      def destroy
        @document_type = DocumentType.find(params[:id])
        if @document_type.destroy
            render json: @document_type, status: :ok
        end

        rescue ActiveRecord::RecordInvalid
            render json: [],status: :not_found
      end


      private 
      def document_type_params
        params.require(:document_type).permit(:name, :description)
      end

    end
    
  end
end