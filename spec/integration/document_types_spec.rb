require 'swagger_helper'

describe 'DocumentTypes API' do


    path '/api/v1/document_types' do

        post 'Creates a Document Type' do
            tags 'Document_Type'
            consumes 'application/json'
            parameter name: :document_type, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string},
                    description: { type: :text}
                },
                required: [ 'name', 'description']
            }

            response '201', 'Created' do
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

        get 'Retrieves a document type' do
            tags 'Document_Type'
            produces 'application/json'
            parameter name: :id, :in => :path, :type => :string
    
            response '200', 'OK' do
                schema type: :object,
                properties: {
                    id: { type: :integer, },
                    name: { type: :string },
                    description: { type: :text }
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

        patch 'Updates a document type' do
            tags 'Document_Type'
            produces 'application/json'
            parameter name: :id, :in => :path, :type => :string
    
            response '200', 'name found - OK' do
                schema type: :object,
                properties: {
                    id: { type: :integer, },
                    name: { type: :string },
                    description: { type: :text }
                },
                required: [ 'id', 'name', 'status' ]

                let(:id) { DocumentTypes.create(name: 'Contrato', description: 'Tipo de documento').id }
                run_test!
                end

            response '404', 'no se encontró el tipo de documento' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


    path '/api/v1/document_types/{id}' do

        delete 'Updates a document type' do
            tags 'Document_Type'
            produces 'application/json'
            parameter name: :id, :in => :path, :type => :string
    
            response '200', 'OK' do
                schema type: :object,
                properties: {
                    id: { type: :integer, },
                    name: { type: :string },
                    description: { type: :text }
                },
                required: [ 'id', 'name', 'status' ]

                let(:id) { DocumentTypes.create(name: 'Contrato', description: 'Tipo de documento').id }
                run_test!
                end

            response '404', 'no se encontró el tipo de documento' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


end

    
