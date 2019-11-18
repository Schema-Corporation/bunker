module Api 
    module V1 
        class BookingProcessesController < ApplicationController

            before_action :authenticate_user!

            def price
                @price = 0.0

                @height = params[:height]
                @width = params[:width]

                @space = Space.find(params[:idSpace])
                if @height == @space.height and @width == @space.width
                    @price = @space.rent_price
                else 
                    @price = @space.rent_price * (@height * @width) * 1.25 / (@space.height * @space.width)
                end

                render json: @price, status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            #GET /booking_processes
            def index
                @booking_processes = BookingProcess.all
                render json: @booking_processes, status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            #GET /booking_processes/lessees/1
            def lessees
                @booking_processes = BookingProcess.all.order(id: :desc).where(step: 0).where(lessee_id: params[:lesseeId])
                render json: @booking_processes, status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            #GET /booking_processes/1
            def show
                @booking_process = BookingProcess.find(params[:id]) 
                if @booking_process != nil
                    render json: @booking_process, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            #POST /booking_intention
            def intention
                @lessee = Lessee.find(params[:lessee][:id])
                @space = Space.find(params[:space][:id])

                @booking_process = BookingProcess.new(
                    lessee_id: @lessee.id,
                    space_id: @space.id,
                    document_id: 1,
                    step: 0,
                    start_date: params[:start_date],
                    end_date: params[:end_date],
                    monthly_fee: params[:monthly_fee],
                    periodicity: params[:periodicity],
                    width: params[:width],
                    height: params[:height]
                )

                if @booking_process.save
                    render json: @booking_process, adapter: :attributes, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity
                
                rescue ActiveController::ParameterMissing
                    render json: [],status: :bad_request
                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            # booking_aprove
            def aprove
                @booking_process=BookingProcess.find(params[:id])
                if @booking_process.update(
                    step: 1
                )
                    render json: @booking_process, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found
                
                rescue ActiveController::ParameterMissing
                    render json: [], status: :bad_request
            end

            # booking_deny
            def deny
                @booking_process=BookingProcess.find(params[:id])
                if @booking_process.update(
                    step: 2
                )
                    render json: @booking_process, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found
                
                rescue ActiveController::ParameterMissing
                    render json: [], status: :bad_request
            end


            #POST /booking_process
            def create
                @lessee = Lessee.find(params[:lessee][:id])
                @space = Space.find(params[:space][:id])
                @document = Document.find(params[:document][:id])

                @booking_process = BookingProcess.new(
                    lessee_id: @lessee.id,
                    space_id: @space.id,
                    document_id: @document.id,
                    step: params[:step],
                    start_date: params[:start_date],
                    end_date: params[:end_date],
                    monthly_fee: params[:monthly_fee],
                    periodicity: params[:periodicity],
                    width: params[:width],
                    height: params[:height]
                    )

                if @booking_process.save
                    render json: @booking_process, adapter: :attributes, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity
                
                rescue ActiveController::ParameterMissing
                    render json: [],status: :bad_request
                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end
            

            #PATCH/PUT /booking_process/1
            def update
                @lessee = Lessee.find(params[:lessee][:id])
                @space = Space.find(params[:space][:id])
                @document = Document.find(params[:document][:id])

                @booking_process=BookingProcess.find(params[:id])
                if @booking_process.update(
                    lessee_id: @lessee.id,
                    space_id: @space.id,
                    document_id: @document.id,
                    step: params[:step],
                    start_date: params[:start_date],
                    end_date: params[:end_date],
                    monthly_fee: params[:monthly_fee],
                    periodicity: params[:periodicity],
                    width: params[:width],
                    height: params[:height]
                )
                    render json: @booking_process, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found
                
                rescue ActiveController::ParameterMissing
                    render json: [], status: :bad_request
            end


            #DELETE /booking_process/1
            def destroy
                @booking_process = BookingProcess.find(params[:id])
                if @booking_process.destroy
                    render json: @booking_process, status: :ok
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :not_found
            end
                

            private
            def booking_process_params
                params.require(:booking_process).permit(
                    :step,
                    :start_date,
                    :end_date,
                    :monthly_fee,
                    :periodicity,
                    :height,
                    :width,
                    lessee: [:id, :user_id, :first_name, :last_name, :doc_type, :doc_number, :phone, :email, :created_at, :updated_at],
                    space: [:id, :lessee_id, :status, :width, :height, :area, :created_at, :updated_at, :rent_price, :space_type, :description],
                    document: [:id, :document_type_id, :url_document, :created_at, :updated_at]
                )
            end
                
        end
    end
end
