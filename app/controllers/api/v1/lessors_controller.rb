module Api
    module V1
        class LessorsController < ApplicationController

            before_action :authenticate_user!
        
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
                @user = User.find(params[:user][:id])

                @lessor = Lessor.new(user_id: @user.id, ruc: params[:ruc], commercial_name: params[:commercial_name], first_name: params[:first_name], last_name: params[:last_name], doc_type: params[:doc_type], doc_number: params[:doc_number], phone: params[:phone], email: params[:email])
                if @lessor.save
                    render json: @lessor, adapter: :attributes, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request
                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
            end


            def update
                @user = User.find(params[:user][:id])

                @lessor = Lessor.find(params[:id])
                if @lessor.update(user_id: @user.id, ruc: params[:ruc], commercial_name: params[:commercial_name], first_name: params[:first_name], last_name: params[:last_name], doc_type: params[:doc_type], doc_number: params[:doc_number], phone: params[:phone], email: params[:email])
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

            def spaces
                @lessor = Lessor.find(params[:id])
                if @lessor.spaces
                    render json: @lessor.spaces, status: :ok
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :not_found
            end

            private 
            def lessor_params
              params.require(:lessor).permit(
                  :ruc,
                  :commercial_name,
                  :first_name, 
                  :last_name, 
                  :doc_type, 
                  :doc_number, 
                  :phone, 
                  :email, 
                  
                  user:  [:id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :created_at, :updated_at]
                )
            end

        end
    end
end