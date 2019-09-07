module Api
    module V1
        class LessorController < ApplicationController
        
            def index
                @lessors = Lessor.all 
                render json: @lessors
            end


            def show 
                render json: @lessor
            end


            def create
                @lessor = Lessor.new(lessor_params)

                if @lessor.save
                    render json: @lessor, status: :created, location: @lessor
                else
                    render json: @lessor.errors, status: :unprocessable_entity
                end
            end


            def update
                if @lessor.update(lessor_params)
                    render json: @lessor
                else
                    render json: @lessor.errors, status: :unprocessable_entity
                end

            end


            def destroy
                @lessor.destroy
            end

        end
    end
end