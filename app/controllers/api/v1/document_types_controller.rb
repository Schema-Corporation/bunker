module Api 
  module V1

    class DocumentTypesController < ApplicationController

        def index
            @DocumentTypes = DocumentType.all
            render json: @DocumentTypes
          end
        
    end
  end
end