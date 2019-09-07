module Api 
    module V1 
        class DeviceController < ApplicationController


            # GET /devices
            def index
                @devices = Devices.all

                render json: @devices
            end

            # GET /devices/1
            def show
                render json: @device
            end

            #POST /devices
            def create
                @device = Devices.new(device_params)
                if @device.save
                    render json: @device, status: :created, location: @device
                else
                    render json: @device.errors, status: :unprocessable_entity
                end
            end

            #PATCH/PUT /devices/1
            def update
                if @device.update(device_params)
                    render json: @device
                else
                    render json: @device.errors, status: :unprocessable_entity
                end
            end

            #DELETE /devices/1
            def destroy
                @device.destroy
            end
        end
    end
end
