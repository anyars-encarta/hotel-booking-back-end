require 'swagger_helper'

RSpec.describe Api::RoomsController, type: :request do
  path '/api/rooms' do
    get 'Retrieves all rooms' do
      tags 'Rooms'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   category_id: { type: :integer }
                 },
                 required: ['id', 'name', 'category_id']
               }

        run_test! do
          expect(response).to have_http_status(:ok)
        end
      end
    end

    post 'Creates a new room' do
      tags 'Rooms'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :room, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          category_id: { type: :integer }
        },
        required: ['name', 'category_id']
      }

      response '201', 'Created' do
        let(:room) { { name: 'Room 1', category_id: 1 } }

        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 category_id: { type: :integer }
               },
               required: ['id', 'name', 'category_id']
      end

      response '422', 'Unprocessable Entity' do
        let(:room) { { name: '', category_id: 1 } }

        schema type: :object,
               properties: {
                 errors: {
                   type: :array,
                   items: { type: :string }
                 }
               },
               required: ['errors']

        run_test! do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  path '/api/rooms/{id}' do
    parameter name: :id, in: :path, type: :string

    get 'Retrieves a room' do
      tags 'Rooms'
      produces 'application/json'

      response '200', 'OK' do
        let(:id) { Room.create(name: 'Room 1', category_id: 1).id }

        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 category_id: { type: :integer }
               },
               required: ['id', 'name', 'category_id']
      end
    end

    delete 'Deletes a room' do
      tags 'Rooms'
      produces 'application/json'

      response '204', 'No Content' do
        let(:id) { Room.create(name: 'Room 1', category_id: 1).id }
      end
    end
  end
end
