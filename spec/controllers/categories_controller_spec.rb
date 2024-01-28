require 'rails_helper'

RSpec.describe Api::CategoriesController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns all categories in JSON format' do
      category1 = Category.create(name: 'Category 1')
      category2 = Category.create(name: 'Category 2')

      get :index
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['name']).to eq(category1.name)
      expect(json_response[1]['name']).to eq(category2.name)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      category = Category.create(name: 'Category 1')

      get :show, params: { id: category.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns the category in JSON format' do
      category = Category.create(name: 'Category 1')

      get :show, params: { id: category.id }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(category.name)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          category: {
            name: 'New Category',
            description: 'Category description',
            image: 'category.jpg',
            number_of_rooms: 5,
            number_reserved: 2,
            price: 100
          }
        }
      end

      it 'creates a new category' do
        expect {
          post :create, params: valid_params
        }.to change(Category, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['name']).to eq(valid_params[:category][:name])
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new category and returns unprocessable entity status' do
        expect {
          post :create, params: { category: { name: nil, description: 'description' } }
        }.not_to change(Category, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to include("Name can't be blank")
      end

      it 'returns unprocessable entity status when name is not unique' do
        Category.create(name: 'Category 1')

        expect {
          post :create, params: { category: { name: 'Category 1', description: 'description' } }
        }.not_to change(Category, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to include('Name has already been taken')
      end

      it 'returns unprocessable entity status when number_of_rooms is not an integer' do
        expect {
          post :create, params: { category: { name: 'Category 1', description: 'description', number_of_rooms: 'abc' } }
        }.not_to change(Category, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to include('Number of rooms is not a number')
      end

      it 'returns unprocessable entity status when number_of_rooms is less than 0' do
        expect {
          post :create, params: { category: { name: 'Category 1', description: 'description', number_of_rooms: -1 } }
        }.not_to change(Category, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to include('Number of rooms must be greater than or equal to 0')
      end

      it 'returns unprocessable entity status when number_reserved is not an integer' do
        expect {
          post :create, params: { category: { name: 'Category 1', description: 'description', number_reserved: 'abc' } }
        }.not_to change(Category, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to include('Number reserved is not a number')
      end

      it 'returns unprocessable entity status when number_reserved is less than 0' do
        expect {
          post :create, params: { category: { name: 'Category 1', description: 'description', number_reserved: -1 } }
        }.not_to change(Category, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to include('Number reserved must be greater than or equal to 0')
      end

      it 'returns unprocessable entity status when price is not an integer' do
        expect {
          post :create, params: { category: { name: 'Category 1', description: 'description', price: 'abc' } }
        }.not_to change(Category, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to include('Price is not a number')
      end

      it 'returns unprocessable entity status when price is less than 0' do
        expect {
          post :create, params: { category: { name: 'Category 1', description: 'description', price: -1 } }
        }.not_to change(Category, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to include('Price must be greater than or equal to 0')
      end
    end
  end
end
