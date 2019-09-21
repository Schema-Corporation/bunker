require 'swagger_helper'
describe 'Space  API' do

   #########POST
    path '/api/v1/spaces' do

        post 'Creates a Space' do
            tags 'Space'
            security [Bearer: {}]
            consumes 'application/json'
            parameter name: :space, in: :body, schema: {
                type: :object, 
                properties: { 
                    status: { type: :integer},
                    width: { type: :number},
                    height: { type: :number},
                    area: { type: :number},
                    created_at: { type: :string},
                    updated_at: { type: :string},
                    rent_price: { type: :number},
                    space_type: { type: :integer},
                    description: { type: :string},
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
                            created_at: { type: :string},
                            updated_at: { type: :string},
                            user: { 
                                type: :object, 
                                properties: {  
                                    id: { type: :integer},
                                    email: { type: :string },
                                    created_at: { type: :string},
                                    updated_at: { type: :string},
                                    
                                }
                            }
                        }
                    }         
                },  
  
                required: [ 'lessor', 'status', 'width','height','area', 'rent_price']
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
                let(:space) { { status:'1',width: '40',height: '50',area: '200'}}
                run_test!
            end

            response '404', 'Not Found' do
                let(:space) { {with: 'prueba' } }
                run_test!
            end

        end
    end
    
    
    ############GET
    path '/api/v1/spaces/{id}' do

        get 'Retrieves a Space' do
            tags 'Space'
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
                    id: { type: :integer},
                    status: { type: :integer},
                    width: { type: :number},
                    height: { type: :number},
                    area: { type: :number},
                    created_at: { type: :string},
                    updated_at: { type: :string},
                    rent_price: { type: :number},
                    space_type: { type: :integer},
                    description: { type: :string},
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
                            created_at: { type: :string},
                            updated_at: { type: :string},
                            user: { 
                                type: :object, 
                                properties: {  
                                    id: { type: :integer},
                                    email: { type: :string },
                                    created_at: { type: :string},
                                    updated_at: { type: :string},
                                    
                                }
                            }
                        }
                    }         
                },             
                required: [ 'lessor', 'status', 'width','height','area', 'rent_price']
                let(:Authorization) { 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTY4NTg4MzkyLCJleHAiOjE1Njg1OTAxOTIsImp0aSI6IjRlMzk5ODU1LWMyMzEtNDc1Yi05MGUzLTYyNDY5NWFmNWRkZiJ9.nkUhw506t3vyt0lLEsPMB74EY4JFzh1IPnyMREmSWLk'}                  
                let(:id) { Spaces.create(status:'1',width: '40',height: '50',area: '200').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

    ######Patch
    path '/api/v1/spaces/{id}' do

        patch 'Modifies a Space' do
            tags 'Space'
            security [Bearer: {}]
            produces 'application/json'

            parameter name: :id, in: :path, type: :integer
            
            parameter name: :space, in: :body, schema: {
                type: :object,
                properties: { 
                    lessor: { 
                        type: :object, 
                        properties: { 
                            id: { type: :integer }, 
                            user: { 
                                type: :object, 
                                properties: {  
                                    id: { type: :integer},
                                    email: { type: :string }
                                            }
                                  },
                            ruc: { type: :string},
                            comercial_name: { type: :string},
                            first_name: { type: :string},
                            last_name: { type: :string},
                            doc_type: { type: :integer},
                            doc_number: { type: :string},
                            phone: { type: :string},
                            email: { type: :string}

                          
                                     }
                            },
                    status: { type: :integer},
                    width: { type: :number},
                    height: { type: :number},
                    area: { type: :number},
                    rent_price: { type: :number},
                    space_type: { type: :integer},                
                    description: { type: :string}
                },
                required: [ 'lessor', 'status', 'width','height','area', 'rent_price', 'space_type']
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
                let(:id) { Space.create(status:'1',width: '40',height: '50',area: '200').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

#########delete
    path '/api/v1/spaces/{id}' do

        delete 'Deletes a Space' do
            tags 'Space'
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
                let(:id) { Space.create(status:'1',width: '40',height: '50',area: '200').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end
end

