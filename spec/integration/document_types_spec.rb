require 'swagger_helper'

describe 'DocumentTypes API' do


    path '/api/v1/document_types' do

        post 'Creates a Document Type' do
            tags 'Document_Type'
            security [Bearer: {}]
            consumes 'application/json'
            parameter name: :document_type, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    description: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
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
                let(:document_type) { {name: 'Contrato', description: 'Descripcion de contrato'}}
                run_test!
            end

            response '404', 'Not Found' do
                let(:document_type) { { name: 'foo' } }
                run_test!
            end

        end
    end


    path '/api/v1/document_types/{id}' do

        get 'Retrieves a Document Type' do
            tags 'Document_Type'
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
                    name: { type: :string },
                    description: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                },
                required: [ 'id', 'name', 'status' ]

                let(:id) { DocumentTypes.create(name: 'Contrato', description: 'Tipo de documento').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

    path '/api/v1/document_types/{id}' do

        patch 'Modifies a Document Type' do
            tags 'Document_Type'
            security [Bearer: {}]
            produces 'application/json'

            parameter name: :id, in: :path, type: :integer
            
            parameter name: :document_type, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    description: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                },
                required: [ 'name', 'description']
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
                let(:id) { DocumentType.create(name: 'abcabc', description: 'descripcion').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


    path '/api/v1/document_types/{id}' do

        delete 'Deletes a Document Type' do
            tags 'Document_Type'
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
                let(:id) { Document_Type.create(name: 'abcabc', description: 'descripcion').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end




end

    
