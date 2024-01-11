# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  let!(:valid_attributes) do
    {
      id:    23,
      name:  FFaker::Name.name,
      email: "#{FFaker::Internet.user_name}@message.com.br"
    }
  end

  let!(:invalid_attributes) do
    {
      id:    23,
      name:  FFaker::Name.name,
      email: ''
    }
  end

  describe 'POST #create' do
    context 'with valid_attributes' do
      it 'should create a new user' do
        expect { post :create, params: { user: valid_attributes } }.to change { User.count }.by(1)
        expect(User.find(23).name).to eq(valid_attributes[:name])
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid_attributes' do
      it 'should not create a new user' do
        expect { post :create, params: { user: invalid_attributes } }.to change { User.count }.by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'should update a user' do
        user = create(:user)

        valid_attributes[:name] = 'teste'
        valid_attributes[:id]   = user.id

        put :update, params: { user: valid_attributes, id: user.id }

        expect(User.find(user.id).name).to eq(valid_attributes[:name])
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
