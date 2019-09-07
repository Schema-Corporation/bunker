module Api
    module V1
        class ServicesController < ApplicationController

            def index 
                @services = Service.all 
                render json: @Services
            end

            def show
                render json: @service
            end


            def create
                @service = Service.new(service_params)

                if @service.save
                    render json: @service, status: :created, location: @service
                else
                    render json: @service.errors, status: :unprocessable_entity
                end
            end


            def update
                if @service.update(service_params)
                    render json: @service
                else 
                    render json: @service.errors, status: unprocessable_entity
                end
            end


            def destroy
                @service.destroy
            end
        end
    end
end
