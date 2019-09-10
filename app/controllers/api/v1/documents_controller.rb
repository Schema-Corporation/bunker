require 'json'

module Api 
    module V1
        class DocumentsController < ApplicationController

            # GET /documents
            def index
                @documents = Document.all
                    render json: @documents,status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            #GET /document/1
            def show
                @document = Document.find(params[:id])
                if @document != nil 
                    render json: @document, status: :ok
                end 

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            #POST /documents
            def create
                @document = Document.new(document_params)

                if @document.save
                    render json: @document, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
            end
            
            # PATCH/PUT /documents/1
            def update
                @document = Document.find(params[:id])
                if @document.update(document_params)
                    render json: @document, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found

                rescue ActionController::ParameterMissing
                    render json: [], status: :bad_request
            end

            #DELETE /document/1
            def destroy
                @document = Document.find(params[:id])
                if @document.destroy
                    render json: @document, status: :ok
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :not_found
            end


            private 
            def document_params
              params.require(:document).permit(:document_type_id, :url_document)
            end
            
        end
    end
end
