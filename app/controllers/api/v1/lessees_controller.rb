module Api 
    module V1
        class LesseesController < ApplicationController
            #GET /lessees
            def index
                @lessees = Lessee.all
                    render json: @lessees,status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            # GET /lessees/1
            def show
                @lessee = Lessee.find(params[:id])
                if @lessee != nil 
                    render json: @lessee, status: :ok
                end 

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end

            def create
                @lessee = Lessee.new(lessee_params)
                if @lessee.save
                    render json: @lessee, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
            end


            def update
                @lessee = Lessee.find(params[:id])
                if @lessee.update(lessee_params)
                    render json: @lessee, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found

                rescue ActionController::ParameterMissing
                    render json: [], status: :bad_request
            end


            def destroy
                @lessee = Lessee.find(params[:id])
                if @lessee.destroy
                    render json: @lessee, status: :ok
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :not_found
            end

            private 
            def lessee_params
              params.require(:lessee).permit(:ruc,:commercial_name, :first_name, :last_name, :doc_type, :doc_number, :phone, :email)
            end

        end
    end
end
