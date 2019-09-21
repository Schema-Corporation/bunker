require 'swagger_helper'
describe 'Photo  API' do

   #########POST
    path '/api/v1/photos' do

        post 'Creates a Photo' do
            tags 'Photo'
            security [Bearer: {}]
            consumes 'application/json'
            parameter name: :photo, in: :body, schema: {
                type: :object,
                properties: {
                    photo_url: { type: :string },
                    created_at: { type: :string},
                    updated_at: { type: :string},
                    space: { 
                                type: :object, 
                                properties: { 
                                        id: { type: :integer },
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
                                                        updated_at: { type: :string}
                                                    }
                                                }
                                            }
                                        }  
                                }
                    }                 
                },
                required: [ 'space', 'photo_url']
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
                let(:photo) { { photo_url: 'ubicacion PC'}}
                run_test!
            end

            response '404', 'Not Found' do
                let(:photo) { {longitude: 'prueba' } }
                run_test!
            end

        end
    end
    
    
    ############GET
    path '/api/v1/photos/{id}' do

        get 'Retrieves a Photo' do
            tags 'Photo'
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
                    photo_url: { type: :string },
                    created_at: { type: :string},
                    updated_at: { type: :string},
                    space: { 
                                type: :object, 
                                properties: { 
                                        id: { type: :integer },
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
                                                        updated_at: { type: :string}
                                                    }
                                                }
                                            }
                                        }  
                                }
                    }                 
                },
                required: [ 'space','photo_url']
                let(:Authorization) { 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTY4NTg4MzkyLCJleHAiOjE1Njg1OTAxOTIsImp0aSI6IjRlMzk5ODU1LWMyMzEtNDc1Yi05MGUzLTYyNDY5NWFmNWRkZiJ9.nkUhw506t3vyt0lLEsPMB74EY4JFzh1IPnyMREmSWLk'}
                let(:id) { Photos.create(photo_url: 'ubicacion PC').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

    ######Patch
    path '/api/v1/photos/{id}' do

        patch 'Modifies a Photo' do
            tags 'Photo'
            security [Bearer: {}]
            produces 'application/json'

            parameter name: :id, in: :path, type: :integer
            
            parameter name: :photo, in: :body, schema: {
                type: :object,
                properties: {
                    photo_url: { type: :string },
                    created_at: { type: :string},
                    updated_at: { type: :string},
                    space: { 
                                type: :object, 
                                properties: { 
                                        id: { type: :integer },
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
                                                        updated_at: { type: :string}
                                                    }
                                                }
                                            }
                                        }  
                                }
                    }                 
                },
                required: [ 'space','photo_url']
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
                let(:id) { Photo.create(photo_url:'ubicacion PC').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

#########delete
    path '/api/v1/photos/{id}' do

        delete 'Deletes a Photo' do
            tags 'Photo'
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
                let(:id) { Photo.create(photo_url: 'ubicacion PC').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end
end

