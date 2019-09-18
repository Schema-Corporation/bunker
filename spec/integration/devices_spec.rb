require 'swagger_helper'

describe 'Devices API' do


    path '/api/v1/devices' do

        post 'Creates a Device' do
            tags 'Device'
            security [Bearer: {}]
            consumes 'application/json'
            parameter name: :device, in: :body, schema: {
                type: :object,
                properties: {
                    device_token: { type: :string}
                },
                required: [ 'device_token']
            }

            parameter({
                in: :header,
                type: :string,
                name: :Authorization,
                required: :true,
                description: 'Authorization token'
            })

            response '201', 'Created' do
                let(:Authorization) { 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTY4NTg4MzkyLCJleHAiOjE1Njg1OTAxOTIsImp0aSI6IjRlMzk5ODU1LWMyMzEtNDc1Yi05MGUzLTYyNDY5NWFmNWRkZiJ9.nkUhw506t3vyt0lLEsPMB74EY4JFzh1IPnyMREmSWLk'}
                let(:device) { {device_token: '54684651654' }}
                run_test!
            end

            response '409', 'Conflict' do
                let(:device) { { device_token: 'abcabc' } }
                run_test!
            end

        end
    end


    path '/api/v1/devices/{id}' do

        get 'Retrieves a Device' do
            tags 'Device'
            security [Bearer: {}]
            produces 'application/json'
            parameter name: :id, in: :path, type: :integer

            parameter({
                in: :header,
                type: :string,
                name: :Authorization,
                required: :true,
                description: 'Authorization token'
            })
    
            response '200', 'OK' do
                schema type: :object,
                properties: {
                    id: { type: :integer },
                    device_token: { type: :string }
                },
                required: [ 'id', 'device_token' ]

                let(:id) { Device.create(device_token: 'abcabc').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


    path '/api/v1/devices/{id}' do

        patch 'Modifies a Device' do
            tags 'Device'
            security [Bearer: {}]
            produces 'application/json'

            parameter name: :id, in: :path, type: :integer
            
            parameter name: :device, in: :body, schema: {
                type: :object,
                properties: {
                    device_token: { type: :string}
                },
                required: [ 'device_token']
            }
    
            parameter({
                in: :header,
                type: :string,
                name: :Authorization,
                required: :true,
                description: 'Authorization token'
            })

            response '200', 'OK' do
                let(:Authorization) { 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTY4NTg4MzkyLCJleHAiOjE1Njg1OTAxOTIsImp0aSI6IjRlMzk5ODU1LWMyMzEtNDc1Yi05MGUzLTYyNDY5NWFmNWRkZiJ9.nkUhw506t3vyt0lLEsPMB74EY4JFzh1IPnyMREmSWLk'}
                let(:id) { Device.create(device_token: 'abcabc').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


    path '/api/v1/devices/{id}' do

        delete 'Deletes a Device' do
            tags 'Device'
            security [Bearer: {}]
            produces 'application/json'

            parameter name: :id, in: :path, type: :integer

            parameter({
                in: :header,
                type: :string,
                name: :Authorization,
                required: :true,
                description: 'Authorization token'
            })

            response '200', 'OK' do
                let(:Authorization) { 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTY4NTg4MzkyLCJleHAiOjE1Njg1OTAxOTIsImp0aSI6IjRlMzk5ODU1LWMyMzEtNDc1Yi05MGUzLTYyNDY5NWFmNWRkZiJ9.nkUhw506t3vyt0lLEsPMB74EY4JFzh1IPnyMREmSWLk'}
                let(:id) { Device.create(device_token: 'abcabc').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

end