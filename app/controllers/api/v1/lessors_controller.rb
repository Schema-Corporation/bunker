module Api
    module V1
        class LessorsController < ApplicationController
        
            def index
                @lessors = Lessor.all
                    render json: @lessors,status: :ok

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end


            def show 
                @lessor = Lessor.find(params[:id])
                if @lessor != nil 
                    render json: @lessor, status: :ok
                end 

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end


            def create
                @lessor = Lessor.new(lessor_params)
                if @lessor.save
                    render json: @lessor, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
            end


            def update
                @lessor = Lessor.find(params[:id])
                if @lessor.update(lessor_params)
                    render json: @lessor, status: :ok
                end

                rescue ActiveRecord::RecordNotFound
                    render json: [], status: :not_found

                rescue ActionController::ParameterMissing
                    render json: [], status: :bad_request

            end


            def destroy
                @lessor = Lessor.find(params[:id])
                if @lessor.destroy
                    render json: @lessor, status: :ok
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :not_found
            end

            private 
            def lessor_params
              params.require(:lessor).permit(:user, :first_name, :last_name, :doc_type, :doc_number, :phone, :email, :type)
            end

        end
    end
end