require 'swagger_helper'

describe 'Booking Processes API' do


    path '/api/v1/booking_processes' do

        post 'Creates a Booking Process' do
            tags 'Booking_Process'
            security [Bearer: {}]
            consumes 'application/json'
            parameter name: :Booking_Process, in: :body, schema: {
                type: :object,
                properties: {

                    lessor: { 
                        type: :object, 
                        properties: { 
                                id: { type: :integer}, 
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
                        }
                    },
                    space: {
                        type: :object, 
                        properties: {
                            id: { type: :integer},
                            lessee: {
                                id: { type: :integer},
                                user: { 
                                    type: :object, 
                                    properties: { 
                                        id: { type: :integer}, 
                                        email: { type: :string },
                                        password: { type: :string}
                                    }
                                },
                                
                                first_name: { type: :string},
                                last_name: { type: :string},
                                doc_type: { type: :integer},
                                doc_number: { type: :string},
                                phone: { type: :string},
                                email: { type: :string}

                            },
                            status: { type: :integer},
                            width: { type: :number, format: :double},
                            height: { type: :number, format: :double},
                            area: { type: :number, format: :double}
                        }
                    },
                    document: {
                        type: :object,
                        properties: {
                            id: { type: :integer},
                            document_type: { 
                                type: :object,
                                properties: {
                                    id: { type: :integer},
                                    name: { type: :string},
                                    description: { type: :string}
                                } 
                            },

                            url_document: { type: :string }
                        } 
                    },
                    step: { type: :integer },
                    start_date: { type: :string},
                    end_date: { type: :string},
                    monthly_fee: { type: :integer}
                },
                required: [ 'lessor', 'space', 'document', 
                'step', 'start_date', 'end_date', 'monthly_fee']
            }

            parameter({
                in: :header,
                type: :string,
                name: :Authorization,
                required: :true,
                description: 'Authorization token'
            })

            response '201', 'Created' do
                let(:booking_process) { { step: '1', start_date: '2019-09-15', end_date: '2020-03-15', monthly_fee: '2000'}}
                run_test!
            end

            response '404', 'Not Found' do
                let(:booking_process) { {start_date: 'today' } }
                run_test!
            end

        end
    end


    path '/api/v1/booking_processes/{id}' do

        get 'Retrieves a Booking Process' do
            tags 'Booking_Process'
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
                    lessor: { 
                        type: :object, 
                        properties: { 
                                id: { type: :integer}, 
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
                        }
                    },
                    space: {
                        type: :object, 
                        properties: {
                            id: { type: :integer},
                            lessee: {
                                id: { type: :integer},
                                user: { 
                                    type: :object, 
                                    properties: { 
                                        id: { type: :integer}, 
                                        email: { type: :string },
                                        password: { type: :string}
                                    }
                                },
                                
                                first_name: { type: :string},
                                last_name: { type: :string},
                                doc_type: { type: :integer},
                                doc_number: { type: :string},
                                phone: { type: :string},
                                email: { type: :string}

                            },
                            status: { type: :integer},
                            width: { type: :number},
                            height: { type: :number},
                            area: { type: :number}
                        }
                    },
                    document: {
                        type: :object,
                        properties: {
                            id: { type: :integer},
                            document_type: { 
                                type: :object,
                                properties: {
                                    id: { type: :integer},
                                    name: { type: :string},
                                    description: { type: :string}
                                } 
                            },

                            url_document: { type: :string }
                        } 
                    },
                    step: { type: :integer },
                    start_date: { type: :string},
                    end_date: { type: :string},
                    monthly_fee: { type: :integer}
                },
                required: [ 'lessor', 'space', 'document', 
                'step', 'start_date', 'end_date', 'monthly_fee']

                let(:id) { BookingProcess.create(step: '1', start_date: '2019-09-15',
                 end_date: '2020-03-15', monthly_fee: '2000').id }
                run_test!   
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

    path '/api/v1/booking_processes/{id}' do

        patch 'Modifies a Booking Proccess' do
            tags 'Booking_Process'
            security [Bearer: {}]
            produces 'application/json'

            parameter name: :id, in: :path, type: :integer
            
            parameter name: :booking_process, in: :body, schema: {
                type: :object,
                properties: {

                    lessor: { 
                        type: :object, 
                        properties: { 
                                id: { type: :integer}, 
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
                        }
                    },
                    space: {
                        type: :object, 
                        properties: {
                            id: { type: :integer},
                            lessee: {
                                id: { type: :integer},
                                user: { 
                                    type: :object, 
                                    properties: { 
                                        id: { type: :integer}, 
                                        email: { type: :string },
                                        password: { type: :string}
                                    }
                                },
                                
                                first_name: { type: :string},
                                last_name: { type: :string},
                                doc_type: { type: :integer},
                                doc_number: { type: :string},
                                phone: { type: :string},
                                email: { type: :string}

                            },
                            status: { type: :integer},
                            width: { type: :number},
                            height: { type: :number},
                            area: { type: :number}
                        }
                    },
                    document: {
                        type: :object,
                        properties: {
                            id: { type: :integer},
                            document_type: { 
                                type: :object,
                                properties: {
                                    id: { type: :integer},
                                    name: { type: :string},
                                    description: { type: :string}
                                } 
                            },

                            url_document: { type: :string }
                        } 
                    },
                    step: { type: :integer },
                    start_date: { type: :string},
                    end_date: { type: :string},
                    monthly_fee: { type: :integer}
                },
                required: [ 'lessor', 'space', 'document', 
                'step', 'start_date', 'end_date', 'monthly_fee']
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
                let(:id) { BookingProcess.create( step: 'uno').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end


    path '/api/v1/booking_processes/{id}' do

        delete 'Deletes a Booking Process' do
            tags 'Booking_Process'
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
                let(:id) { BookingProcess.create(phone: 'descripcion').id }
                run_test!
                end

            response '404', 'Not Found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

end
