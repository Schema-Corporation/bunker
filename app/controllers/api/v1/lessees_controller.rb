module Api 
    module V1
        class LesseesController < ApplicationController
            #GET /lessees
            def index
                @lessees = Lesse.all 
                render json: @lessees
            end

            # GET /lessees/1
            def show
                render json: @lessee
            end

            def create
                @lessee = Lesse.new(lessee_params)

                if @lessee.save
                    render json: @lessee, status: created, location: @lessee
                else
                    render json: @lessee.errors, status: :unprocessable_entity
                end
            end


            def update
                if @lessee.update(lessee_params)
                    render json: @lessee
                else
                    render json: @lessee.errors, status: :unprocessable_entity
                end
            end


            def destroy
                @lessee.destroy
            end


        end
    end
end
