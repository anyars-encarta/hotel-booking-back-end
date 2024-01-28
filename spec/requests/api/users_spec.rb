require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  let(:user_params) do
    {
      user: {
        username: 'testuser',
        email: 'test@gmail.com',
        password: 'password',
        password_confirmation: 'password'

      }
    }
  end

  path '/api/users' do
    post('create user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              username: { type: :string },
              email: { type: :string },
              password: { type: :string },
              password_confirmation: { type: :string }
            }
          }
        }
      }

      response(201, 'successful') do
        let(:user) { user_params }
        run_test!
      end

      response(422, 'invalid request') do
        let(:user) { { user: { username: 'testuser', email: 'test@gmail.com' } } }
        run_test!
      end
    end
  end

  path '/api/users/{id}' do
    get('show user') do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response(200, 'successful') do
        let(:id) { User.create(user_params[:user]).id }
        run_test!
      end

      response(404, 'user not found') do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
