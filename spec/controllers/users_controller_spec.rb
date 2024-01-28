require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns all users in JSON format' do
      user1 = User.create(username: 'john_doe', email: 'john@example.com', password: 'password')
      user2 = User.create(username: 'jane_doe', email: 'jane@example.com', password: 'password')

      get :index
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['username']).to eq(user1.username)
      expect(json_response[1]['username']).to eq(user2.username)
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(username: 'john_doe', email: 'john@example.com', password: 'password') }

    it 'returns a successful response' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns the user in JSON format' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['username']).to eq(user.username)
      expect(json_response['email']).to eq(user.email)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          user: {
            username: 'john_doe',
            email: 'john@example.com',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      end

      it 'creates a new user' do
        expect {
          post :create, params: valid_params
        }.to change(User, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['username']).to eq(valid_params[:user][:username])
        expect(json_response['email']).to eq(valid_params[:user][:email])
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          user: {
            username: 'john_doe',
            email: 'john@example.com',
            password: 'password',
            password_confirmation: 'wrong_password'
          }
        }
      end

      it 'does not create a new user and returns unprocessable entity status' do
        expect {
          post :create, params: invalid_params
        }.not_to change(User, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response['password_confirmation']).to include("doesn't match Password")
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { User.create(username: 'john_doe', email: 'john@example.com', password: 'password') }

    it 'destroys the user' do
      expect {
        delete :destroy, params: { id: user.id }
      }.to change(User, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
