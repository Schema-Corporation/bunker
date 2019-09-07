module Api 
  module V1

    class DocumentTypesController < ApplicationController



      #GET /document_types
      def index
          @document_types = DocumentType.all
          render json: {status: 'SUCCESS', data:@document_types}, status: :ok
      end
        
      # GET /document_types/1
      def show
        render json: @document_type
      end

      # POST /document_types
      def create
        @document_type = DocumentType.new(document_type_params)

        if @document_type.save
          render json: @document_type, status: :created, location: @document_type
        else
          render json: @document_type.errors, status: :unprocessable_entity
        end
      end


      # PATCH/PUT /document_types/1
      def update
        if @document_type.update(document_type_params)
          render json: @document_type
        else
          render json: @document_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /document_types/1
      def destroy
        @document_type.destroy
      end


    end
    
  end
end