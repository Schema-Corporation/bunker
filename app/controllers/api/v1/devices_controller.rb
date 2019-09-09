module Api 
    module V1 
        class DevicesController < ApplicationController


            # GET /devices
            def index
                @devices = Device.all
                    render json: @devices,status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            # GET /devices/1
            def show
                @device = Device.find(params[:id])
                if @device != nil 
                    render json: @device, status: :ok
                end 

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            #POST /devices
            def create
                @device = Device.new(device_params)
                if @device.save
                    render json: @device, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
            end

            #PATCH/PUT /devices/1
            def update
                @device = Device.find(params[:id])
                if @device.update(device_params)
                    render json: @device, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found

                rescue ActionController::ParameterMissing
                    render json: [], status: :bad_request
            end

            #DELETE /devices/1
            def destroy
                @device = Device.find(params[:id])
                if @device.destroy
                    render json: @device, status: :ok
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :not_found
            end
            
            private 
            def device_params
                params.require(:device).permit(:device_token)
            end

        end
    end
end
