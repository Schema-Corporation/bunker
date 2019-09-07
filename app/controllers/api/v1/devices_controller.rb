module Api 
    module V1 
        class DevicesController < ApplicationController


            # GET /devices
            def index
                @devices = Device.all
                render json: {status: 'success', message:'Loaded devices', data:@devices},status: :ok

            end

            # GET /devices/1
            def show
                @device = Device.find(params[:id])
                if @device != nil 
                render json: {status: 'success', message:'Loaded device', data:@device,code: 200}
                else 
                render json: {status: 'FAILS', message:'Loaded device', data:nil,code: 404}
            
             end 
            end

            #POST /devices
            def create
                @devices = Device.new(device_params)
                if @devices.save
                    render json: {code:200, status: 'success', message:'Saved device', data:@devices},status: :ok
                else
                    render json: {code:404, status: 'ERROR', message:'Device not saved'}

                end
            end

            #PATCH/PUT /devices/1
            def update
                if @devices.update(device_params)
                    #render json: @device
                    render json: {status: 'success', message:'Updated Advice', data:@devices},status: :ok
                else
                    #render json: @device.errors, status: :unprocessable_entity
                    render json: {status: 'ERROR', message:'Article not updated'}

                end
            end

            #DELETE /devices/1
            def destroy
                @device = Device.find(params[:id])
                if @device.destroy
                    render json: {code:200,status: 'success', message:'Device deleted ', data:@devices}

                end

                rescue ActiveRecord::RecordNotFound
                    render json: {code:404  ,status: 'Not Found', message: "Device not found", data:nil}
            end
            
            private 
            # Only allow a trusted parameter "white list" through.
            def device_params
                # Reemplazamos :password_digest por :password y :password_confirmation
                params.require(:device).permit(:device_token)
            end

        end
    end
end
