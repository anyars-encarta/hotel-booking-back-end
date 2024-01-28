require 'rails_helper'

RSpec.describe Api::ReservationsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns all reservations in JSON format' do
      user = User.create(email: 'test@gmail.com', username: 'test', password: 'password')
      category = Category.create(name: 'Category 1')
      room = Room.create(name: 'Room 1', category_id: category.id)
      reservation1 = Reservation.create(user_id: user.id, room_id: room.id)
      reservation2 = Reservation.create(user_id: user.id, room_id: room.id)
      expect(Reservation.count).to eq(2)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          user_id: 1,
          room_id: 1
        }
      end

      it 'creates a new reservation' do
        user = User.create(email: 'test@gmail.com', username: 'test', password: 'password')
        category = Category.create(name: 'Category 1')
        room = Room.create(name: 'Room 1', category_id: category.id)
        valid_params = {
          user_id: user.id,
          room_id: room.id
        }

        expect {
          post :create, params: valid_params
        }.to change(Reservation, :count).by(1)

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'Un reserved room' do
    it 'un reserves a room' do
      user = User.create(email: 'test@gmail.com', username: 'test', password: 'password')
      category = Category.create(name: 'Category 1')
      room = Room.create(name: 'Room 1', category_id: category.id)
      reservation = Reservation.create(user_id: user.id, room_id: room.id)
      expect(Reservation.count).to eq(1)

      delete :destroy, params: { id: room.id }
      expect(response).to have_http_status(:ok)
      expect(Reservation.count).to eq(0)

      room.reload
      expect(room.reserved).to eq(false)

      user.reload
      expect(user.reservations.count).to eq(0)

    end
  end

end
