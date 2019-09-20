require 'swagger_helper'

describe 'Documents API' do


    path '/api/v1/documents' do

        post 'Creates a Document' do
            tags 'Document'
            security [Bearer: {}]
            consumes 'application/json'
            parameter name: :document, in: :body, schema: {
                type: :object,
                properties: {
                    document_type: { 
                        type: :object,
                        properties: {
                            id: { type: :integer},
                            name: { type: :string},
                            description: { type: :string},
                            created_at: { type: :string },
                            updated_at: { type: :string }
                        } },
                    url_document: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                },
                required: [ 'document_type', 'url_document']
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
                let(:document) { { url_document: 'URL del documento'}}
                run_test!
            end

            response '404', 'Not Found' do
                let(:document) { { url_document: '999' } }
                run_test!
            end

        end
    end


    path '/api/v1/documents/{id}' do

        get 'Retrieves a Document' do
            tags 'Document'
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
                    id: { type: :integer},
                    document_type: { 
                        type: :object,
                        properties: {
                            id: { type: :integer},
                            name: { type: :string},
                            description: { type: :string}
                        } },
                    url_document: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                }

                let(:id) { Documents.create(url_document: 'URL del documento').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


    path '/api/v1/documents/{id}' do

        patch 'Modifies a Document' do
            tags 'Document'
            security [Bearer: {}]
            produces 'application/json'

            parameter name: :id, in: :path, type: :integer
            
            parameter name: :document, in: :body, schema: {
                type: :object,
                properties: {
                    document_type: { 
                        type: :object,
                        properties: {
                            id: { type: :integer},
                            name: { type: :string},
                            description: { type: :string}
                        } },
                    url_document: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                },
                required: [ 
                'document_type',
                'url_document']
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
                let(:id) { Document.create( url_document: 'descripcion').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


    path '/api/v1/documents/{id}' do

        delete 'Deletes a Document' do
            tags 'Document'
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
                let(:id) { Document.create(url_document: 'descripcion').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end





end