class DocumentTypeController < ApplicationController

    def index
        @DocumentTypes = DocumentType.all
    
        render json: @DocumentTypes
      end
    
end
