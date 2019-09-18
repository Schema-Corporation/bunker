module Api 
    module V1 
        class SpaceServiceDetailsController < ApplicationController

            before_action :authenticate_user!


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
                @space = Space.find(params[:space][:id])
                @service = Service.find(params[:service][:id])

                @space_service_detail = SpaceServiceDetail.new(space_id: @space.id, service_id: @service.id, status: params[:status], start_date: params[:start_date], end_date: params[:end_date], service_price: params[:service_price])
                if @space_service_detail.save
                    render json: @space_service_detail, adapter: :attributes, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
                
                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end


            # PATCH/PUT /space_service_details/1
            def update
                @space = Space.find(params[:space][:id])
                @service = Service.find(params[:service][:id])

                @space_service_detail = SpaceServiceDetail.find(params[:id])
                if @space_service_detail.update(space_id: @space.id, service_id: @service.id, status: params[:status], start_date: params[:start_date], end_date: params[:end_date], service_price: params[:service_price])
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


            private
            def space_service_detail_params
                params.require(:space_service_detail).permit(
                    :status,
                    :start_date,
                    :end_date,
                    :service_price,
                    space: [:id, :lessee_id, :status, :width, :height, :area, :created_at, :updated_at, :rent_price],
                    service: [:id, :name, :description, :created_at, :updated_at]
                )
            end

        end
    end
end
