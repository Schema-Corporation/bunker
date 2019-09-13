module Api 
    module V1
        class DocumentsController < ApplicationController


            before_action :authenticate_user!
            
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

                @documentType = DocumentType.find(params[:document_type][:id])

                @document = Document.new(document_type_id: @documentType.id, url_document: params[:url_document])

                if @document.save
                    render json: @document, adapter: :attributes, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end
            
            # PATCH/PUT /documents/1
            def update
                @documentType = DocumentType.find(params[:document_type][:id])

                @document = Document.find(params[:id])
                if @document.update(document_type_id: @documentType.id, url_document: params[:url_document])
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
              params.require(:document).permit(
                  :url_document,
                  :document_type_id,
                  document_type: [ :id, :name, :description, :created_at, :updated_at ]
                )
            end
            
        end
    end
end
