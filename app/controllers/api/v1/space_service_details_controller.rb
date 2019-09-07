module Api 
    module V1 
        class SpaceServiceDetailsController < ApplicationController
            #GET /space_service_details
            def index
                @Space_Service_Details = SpaceServiceDetail.all
                render json: @Space_Service_Details
            end
            
            # GET /space_service_details/1
            def show
                render json: @Space_Service_Detail
            end

            # POST /space_service_details
            def create
                @space_service_detail = SpaceServiceDetail.new(space_service_detail_params)

                if @space_service_detail.save
                    render json: @space_service_detail, status: :created, location: @space_service_detail
                else
                    render json: @space_service_detail.errors, status: :unprocessable_entity
                end
            end


            # PATCH/PUT /space_service_details/1
            def update
                if @space_service_detail.update(space_service_detail_params)
                    render json: @space_service_detail
                else
                    render json: @space_service_detail.errors, status: :unprocessable_entity
                end
            end

            # DELETE /space_service_details/1
            def destroy
                @space_service_detail.destroy
            end



        end
    end
end
