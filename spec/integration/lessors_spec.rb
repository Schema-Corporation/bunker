require 'swagger_helper'

describe 'Lessors API' do


    path '/api/v1/lessors' do

        post 'Creates a Lessor' do
            tags 'Lessor'
            security [Bearer: {}]
            consumes 'application/json'
            parameter name: :lessor, in: :body, schema: {
                type: :object,
                properties: {
                    user: { 
                        type: :object, 
                        properties: {  
                            id: { type: :integer}, 
                            email: { type: :string },
                            password: { type: :string}
                        }
                    },
                    ruc: { type: :string},
                    commercial_name: { type: :string},
                    first_name: { type: :string},
                    last_name: { type: :string},
                    doc_type: { type: :integer},
                    doc_number: { type: :string},
                    phone: { type: :string},
                    email: { type: :string}
                },
                required: [ 'user', 'ruc', 'commercial_name', 'first_name', 'last_name', 
                'doc_type', 'doc_number', 'phone', 'email']
            }

            parameter({
                in: :header,
                type: :string,
                name: :Authorization,
                required: :true,
                description: 'Authorization token'
            })

            response '201', 'Created' do
                let(:lessor) { { ruc: '6465464', commercial_name: 'Empresa', first_name: 'Kevin', last_name: 'Burga', doc_type: '1', 
                doc_number: '7', phone: '933436802', email: 'kevinburga@hotmail.com'}}
                run_test!
            end

            response '404', 'Not Found' do
                let(:lessor) { {doc_type: 'foo' } }
                run_test!
            end

        end
    end


    path '/api/v1/lessors/{id}' do

        get 'Retrieves a lessor' do
            tags 'Lessor'
            security [Bearer: {}]
            produces 'application/json'
            parameter name: :id, :in => :path, :type => :string

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
                    user: { 
                        type: :object, 
                        properties: {  
                            id: { type: :integer}, 
                            email: { type: :string },
                            password: { type: :string}
                        }
                    },
                    ruc: { type: :string},
                    commercial_name: { type: :string},
                    first_name: { type: :string},
                    last_name: { type: :string},
                    doc_type: { type: :integer},
                    doc_number: { type: :string},
                    phone: { type: :string},
                    email: { type: :string}
                },
                required: [ 'id', 'user', 'ruc', 'commercial_name', 'first_name', 'last_name', 
                'doc_type', 'doc_number', 'phone', 'email']

                let(:id) { Lessor.create( ruc: '6465464', commercial_name: 'Empresa', first_name: 'Kevin', last_name: 'Burga', doc_type: '1', 
                doc_number: '7', phone: '933436802', email: 'kevinburga@hotmail.com').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


    path '/api/v1/lessors/{id}' do

        patch 'Modifies a lessor' do
            tags 'Lessor'
            security [Bearer: {}]
            produces 'application/json'

            parameter name: :id, in: :path, type: :integer
            
            parameter name: :lessor, in: :body, schema: {
                type: :object,
                properties: {

                    user: { 
                        type: :object, 
                        properties: {  
                            id: { type: :integer}, 
                            email: { type: :string },
                            password: { type: :string}
                        }
                    },
                    ruc: { type: :string},
                    commercial_name: { type: :string},
                    first_name: { type: :string},
                    last_name: { type: :string},
                    doc_type: { type: :integer},
                    doc_number: { type: :string},
                    phone: { type: :string},
                    email: { type: :string}
                },
                required: [ 'user', 'ruc', 'commercial_name', 'first_name', 'last_name', 
                'doc_type', 'doc_number', 'phone', 'email']
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
                let(:id) { Lessor.create( phone: 'phone').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


    path '/api/v1/lessor/{id}' do

        delete 'Deletes a lessor' do
            tags 'Lessor'
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
                let(:id) { Lessor.create(phone: 'descripcion').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


end
