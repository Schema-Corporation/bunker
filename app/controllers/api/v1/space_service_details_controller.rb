module Api 
    module V1 
        class SpaceServiceDetailsController < ApplicationController
            #GET /space_service_details
            def index
                @space_service_details = SpaceServiceDetail.all
                    render json: @space_service_details,status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end
            
            # GET /space_service_details/1
            def show
                @space_service_detail = SpaceServiceDetail.find(params[:id])
                if @space_service_detail != nil 
                    render json: @space_service_detail, status: :ok
                end 

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            # POST /space_service_details
            def create
                @space_service_detail = SpaceServiceDetail.new(space_service_detail_params)
                if @space_service_detail.save
                    render json: @space_service_detail, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
            end


            # PATCH/PUT /space_service_details/1
            def update
                @space_service_detail = SpaceServiceDetail.find(params[:id])
                if @space_service_detail.update(space_service_detail_params)
                    render json: @space_service_detail, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found

                rescue ActionController::ParameterMissing
                    render json: [], status: :bad_request
            end

            # DELETE /space_service_details/1
            def destroy
                @space_service_detail = SpaceServiceDetail.find(params[:id])
                if @space_service_detail.destroy
                    render json: @space_service_detail, status: :ok
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :not_found
            end



        end
    end
end
