module Api 
    module V1
        class LesseesController < ApplicationController

            before_action :authenticate_user!


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
                @user = User.find(params[:user][:id])

                @lessee = Lessee.new(user_id: @user.id, ruc: params[:ruc], commercial_name: params[:commercial_name], first_name: params[:first_name], last_name: params[:last_name], doc_type: params[:doc_type], doc_number: params[:doc_number], phone: params[:phone], email: params[:email])
                if @lessee.save
                    render json: @lessee, adapter: :attributes, status: :created
                end

                rescue ActiveRecord::RecordInvalid
                    render json: [],status: :unprocessable_entity

                rescue ActionController::ParameterMissing
                    render json: [],status: :bad_request

                rescue ActiveRecord::RecordNotFound
                    render json: [],status: :not_found
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
              params.require(:lessee).permit(
                  :ruc,
                  :commercial_name, 
                  :first_name, 
                  :last_name, 
                  :doc_type, 
                  :doc_number, 
                  :phone, 
                  :email,
                  
                  user: [:id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, remember_created_at, created_at, updated_at]
                )
            end

        end
    end
end
