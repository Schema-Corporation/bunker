module Api 
    module V1


        class DocumentsController < ApplicationController

            # GET /documents
            def index
                @documents = Document.all 

                render json: @documents
            end

            #GET /document/1
            def show
                render json: @document
            end

            #POST /documents
            def create 
                @document = Document.new(document_params)

                if @document.save
                    render json: @document, status: :created, location: @document
                else
                    render json: @document.errors, status: :unprocessable_entity
                end
            end
            
            # PATCH/PUT /documents/1
            def update
                if @document.update(document_params)
                    render json: @document
                else 
                    render json: @document.errors, status: :unprocessable_entity
                end
            end

            #DELETE /document/1
            def destroy
                @document.destroy
            end

            
        end
    end
end
