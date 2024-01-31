require 'swagger_helper'

RSpec.describe Api::CategoriesController, type: :request do
  path '/api/categories' do
    get 'Retrieves all categories' do
      tags 'Categories'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :string },
                   image: { type: :string },
                   number_of_rooms: { type: :integer },
                   number_reserved: { type: :integer },
                   price: { type: :integer }
                 },
                 required: %w[id name description]
               }

        examples 'application/json' => [
          {
            id: 1,
            name: 'Category 1',
            description: 'Description 1',
            image: 'example.jpg',
            number_of_rooms: 10,
            number_reserved: 5,
            price: 100
          },
          {
            id: 2,
            name: 'Category 2',
            description: 'Description 2',
            image: 'example2.jpg',
            number_of_rooms: 5,
            number_reserved: 2,
            price: 200
          }
        ]

        run_test!
      end
    end

    post 'Creates a new category' do
      tags 'Categories'
      consumes 'application/json'
      parameter name: :category, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          image: { type: :string },
          number_of_rooms: { type: :integer },
          number_reserved: { type: :integer },
          price: { type: :integer }
        },
        required: %w[name description]
      }

      response '201', 'Created' do
        let(:category) do
          {
            name: 'New Category',
            description: 'New Description',
            image: 'new_image.jpg',
            number_of_rooms: 20,
            number_reserved: 10,
            price: 150
          }
        end

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:category) { { name: '', description: '' } }

        run_test!
      end
    end
  end

  path '/api/categories/{id}' do
    parameter name: :id, in: :path, type: :integer

    get 'Retrieves a specific category' do
      tags 'Categories'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 image: { type: :string },
                 number_of_rooms: { type: :integer },
                 number_reserved: { type: :integer },
                 price: { type: :integer }
               },
               required: %w[id name description]
      end
      response '404', 'Not Found' do
        let(:id) { 999 }

        run_test!
      end
    end
  end
end
