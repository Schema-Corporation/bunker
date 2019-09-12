module Api
    module V1
        class ServicesController < ApplicationController

            before_action :authenticate_user!

            def index 
                @services = Service.all
                    render json: @services,status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            def show
                @service = Service.find(params[:id])
                if @service != nil 
                    render json: @service, status: :ok
                end 

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end


            def create
                @service = Service.new(service_params)
                if @service.save
                    render json: @service, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
            end


            def update
                @service = Service.find(params[:id])
                if @service.update(service_params)
                    render json: @service, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found

                rescue ActionController::ParameterMissing
                    render json: [], status: :bad_request
            end


            def destroy
                @service = Service.find(params[:id])
                if @service.destroy
                    render json: @service, status: :ok
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :not_found
            end
        end
    end
end
