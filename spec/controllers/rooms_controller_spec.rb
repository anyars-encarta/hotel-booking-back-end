require 'rails_helper'

RSpec.describe Api::RoomsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns all rooms in JSON format' do
      category = Category.create(name: 'Category 1')
      room1 = Room.create(name: 'Room 1', category_id: category.id)
      room2 = Room.create(name: 'Room 2', category_id: category.id)

      get :index
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['name']).to eq(room1.name)
      expect(json_response[1]['name']).to eq(room2.name)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      category = Category.create(name: 'Category 1')
      room = Room.create(name: 'Room 1', category_id: category.id)

      get :show, params: { id: room.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns the room in JSON format' do
      category = Category.create(name: 'Category 1')
      room = Room.create(name: 'Room 1', category_id: category.id)

      get :show, params: { id: room.id }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(room.name)
    end
  end

  describe 'POST #create' do
    it 'creates a new room' do
      category = Category.create(name: 'Category 1')
      valid_params = {
        room: {
          name: 'New Room',
          category_id: category.id
        }
      }

      expect do
        post :create, params: valid_params
      end.to change(Room, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a room' do
      category = Category.create(name: 'Category 1')
      room = Room.create(name: 'Room 1', category_id: category.id)

      expect do
        delete :destroy, params: { id: room.id }
      end.to change(Room, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
