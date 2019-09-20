require 'swagger_helper'
describe 'Location  API' do

   #########POST
    path '/api/v1/locations' do

        post 'Creates a Location' do
            tags 'Location'
            security [Bearer: {}]
            consumes 'application/json'
            parameter name: :location, in: :body, schema: {
                type: :object,
                properties: {
                    address:  { type: :string },
                    latitude: { type: :number },
                    longitude: { type: :number },
                    created_at: { type: :string },
                    updated_at: { type: :string },
                    space: { 
                        type: :object, 
                        properties: { 
                            id: { type: :string },
                            status: { type: :integer },
                            width: { type: :number },
                            height: { type: :number },
                            area: { type: :number },
                            created_at: { type: :string },
                            updated_at: { type: :string },
                            rent_price: { type: :number },
                            lessor: { 
                                type: :object, 
                                properties: { 
                                    id: { type: :integer },
                                    ruc: { type: :string},
                                    comercial_name: { type: :string},
                                    first_name: { type: :string},
                                    last_name: { type: :string},
                                    doc_type: { type: :integer},
                                    doc_number: { type: :string},
                                    phone: { type: :string},
                                    email: { type: :string},
                                    created_at: { type: :string },
                                    updated_at: { type: :string },
                                    user: { 
                                        type: :object, 
                                        properties: {  
                                            id: { type: :integer},
                                            email: { type: :string },
                                            created_at: { type: :string },
                                            updated_at: { type: :string },
                                        }
                                    }    
                                }
                            }
                        }
                    }
                }
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
                let(:location) { { address: 'calle bayobar 126',latitude: '123123.12',longitude: '123233.32'}}
                run_test!
            end

            response '404', 'Not Found' do
                let(:location) { {longitude: 'prueba' } }
                run_test!
            end

        end
    end
    
    
    ############GET
    path '/api/v1/locations/{id}' do

        get 'Retrieves a Location' do
            tags 'Location'
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
                    address:  { type: :string },
                    latitude: { type: :number },
                    longitude: { type: :number },
                    created_at: { type: :string },
                    updated_at: { type: :string },
                    space: { 
                        type: :object, 
                        properties: { 
                            id: { type: :string },
                            status: { type: :integer },
                            width: { type: :number },
                            height: { type: :number },
                            area: { type: :number },
                            created_at: { type: :string },
                            updated_at: { type: :string },
                            rent_price: { type: :number },
                            lessor: { 
                                type: :object, 
                                properties: { 
                                    id: { type: :integer },
                                    ruc: { type: :string},
                                    comercial_name: { type: :string},
                                    first_name: { type: :string},
                                    last_name: { type: :string},
                                    doc_type: { type: :integer},
                                    doc_number: { type: :string},
                                    phone: { type: :string},
                                    email: { type: :string},
                                    created_at: { type: :string },
                                    updated_at: { type: :string },
                                    user: { 
                                        type: :object, 
                                        properties: {  
                                            id: { type: :integer},
                                            email: { type: :string },
                                            created_at: { type: :string },
                                            updated_at: { type: :string },
                                        }
                                    }    
                                }
                            }
                        }
                    }
                }
                let(:Authorization) { 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTY4NTg4MzkyLCJleHAiOjE1Njg1OTAxOTIsImp0aSI6IjRlMzk5ODU1LWMyMzEtNDc1Yi05MGUzLTYyNDY5NWFmNWRkZiJ9.nkUhw506t3vyt0lLEsPMB74EY4JFzh1IPnyMREmSWLk'}
                let(:id) { Locations.create(address: 'Calle bayobar 126', latitude: '123123.23',longitude: '43123.12').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

    ######Patch
    path '/api/v1/locations/{id}' do

        patch 'Modifies a Location' do
            tags 'Location'
            security [Bearer: {}]
            produces 'application/json'

            parameter name: :id, in: :path, type: :integer
            
            parameter name: :location, in: :body, schema: {
                type: :object,
                properties: {
                    address:  { type: :string },
                    latitude: { type: :number },
                    longitude: { type: :number },
                    created_at: { type: :string },
                    updated_at: { type: :string },
                    space: { 
                        type: :object, 
                        properties: { 
                            id: { type: :string },
                            status: { type: :integer },
                            width: { type: :number },
                            height: { type: :number },
                            area: { type: :number },
                            created_at: { type: :string },
                            updated_at: { type: :string },
                            rent_price: { type: :number },
                            lessor: { 
                                type: :object, 
                                properties: { 
                                    id: { type: :integer },
                                    ruc: { type: :string},
                                    comercial_name: { type: :string},
                                    first_name: { type: :string},
                                    last_name: { type: :string},
                                    doc_type: { type: :integer},
                                    doc_number: { type: :string},
                                    phone: { type: :string},
                                    email: { type: :string},
                                    created_at: { type: :string },
                                    updated_at: { type: :string },
                                    user: { 
                                        type: :object, 
                                        properties: {  
                                            id: { type: :integer},
                                            email: { type: :string },
                                            created_at: { type: :string },
                                            updated_at: { type: :string },
                                        }
                                    }    
                                }
                            }
                        }
                    }
                }
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
                let(:id) { Location.create(address: 'Calle bayobar 126', latitude: '123123.23',longitude: '43123.12').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

#########delete
    path '/api/v1/locations/{id}' do

        delete 'Deletes a Location' do
            tags 'Location'
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
                let(:id) { Location.create(address: 'Calle bayobar 126', latitude: '123123.23',longitude: '43123.12').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end
end

