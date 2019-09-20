require 'swagger_helper'
describe 'Space Service Detail  API' do

   #########POST
    path '/api/v1/space_service_details' do

        post 'Creates a Space Service Detail' do
            tags 'Space Service Detail'
            security [Bearer: {}]
            consumes 'application/json'
            parameter name: :space_service_detail, in: :body, schema: {
                type: :object,
                properties: {

                    space: { 
                                type: :object, 
                                properties: {
                                         id: { type: :integer }, 
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
                                        rent_price: { type: :number}
                                }
                              },

                    service: { 
                            type: :object, 
                            properties: {
                                id: { type: :integer},
                                name: { type: :string},
                                description: { type: :string}
                                        }
                            },  
                    status: { type: :number},
                    start_date: { type: :string},
                    end_date: { type: :string},
                    service_price: { type: :number}
                  
                },
                required: [ 'space','service','status','start_date','end_date']
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
                let(:space_service_detail) { { status: '1',start_date: '2019-05-13',end_date:'2020-01-14'}}
                run_test!
            end

            response '404', 'Not Found' do
                let(:location) { {start_date: 'prueba' } }
                run_test!
            end

        end
    end
    
    
    ############GET
    path '/api/v1/space_service_details/{id}' do

        get 'Retrieves a Space Service Detail' do
            tags 'Space Service Detail'
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
                    id: {type: :integer },
                    space: { 
                                type: :object, 
                                properties: {
                                        id: { type: :integer }, 
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
                                        rent_price: { type: :number}
                                }
                              },

                    service: { 
                            type: :object, 
                            properties: {
                                id: { type: :integer},
                                name: { type: :string},
                                description: { type: :string}
                                        }
                            },  
                    status: { type: :number},
                    start_date: { type: :string},
                    end_date: { type: :string},
                    service_price: { type: :number}
                  
                },
                required: [ 'space','service','status','start_date','end_date']
                let(:Authorization) { 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTY4NTg4MzkyLCJleHAiOjE1Njg1OTAxOTIsImp0aSI6IjRlMzk5ODU1LWMyMzEtNDc1Yi05MGUzLTYyNDY5NWFmNWRkZiJ9.nkUhw506t3vyt0lLEsPMB74EY4JFzh1IPnyMREmSWLk'}
                let(:id) { Space_service_details.create(status: '1',start_date: '2019-05-13',end_date:'2020-01-14').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

    ######Patch
    path '/api/v1/space_service_details/{id}' do

        patch 'Modifies a Space Service Detail' do
            tags 'Space Service Detail'
            security [Bearer: {}]
            produces 'application/json'

            parameter name: :id, in: :path, type: :integer
            
            parameter name: :space_service_detail, in: :body, schema: {
                type: :object,
                properties: {

                    space: { 
                                type: :object, 
                                properties: {
                                        id: { type: :integer }, 
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
                                        rent_price: { type: :number}
                                }
                              },

                    service: { 
                            type: :object, 
                            properties: {
                                id: { type: :integer},
                                name: { type: :string},
                                description: { type: :string}
                                        }
                            },  
                    status: { type: :number},
                    start_date: { type: :string},
                    end_date: { type: :string},
                    service_price: { type: :number}
                  
                },
                required: [ 'space','service','status','start_date','end_date']
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
                let(:id) { Space_service_detail.create(status: '1',start_date: '2019-05-13',end_date:'2020-01-14').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

#########delete
    path '/api/v1/space_service_details/{id}' do

        delete 'Deletes a Space Service Detail' do
            tags 'Space Service Detail'
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
                let(:id) { Space_service_detail.create(status: '1',start_date: '2019-05-13',end_date:'2020-01-14').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end
end

