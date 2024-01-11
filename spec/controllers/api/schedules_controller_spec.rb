# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::SchedulesController, type: :controller do
  let!(:user)     { create(:user) }
  let!(:slot_schedule)     { create(:slot_schedule) }
  let!(:schedule) { create(:schedule, user: user) }

  let!(:valid_attributes) do
    {
      date:        Date.today,
      start_at:    Time.now,
      end_at:      Time.now + 2.hours,
      action:      'Primeira_Visita',
      origin:      'CRM',
      user_id:     user.id,
      destiny_url: FFaker::Internet.unique.http_url,
      notes:       FFaker::Lorem.unique.paragraphs,
      interested:  FFaker::Name.name,
      origin_id:   schedule.origin_id,
      origin_type: 'Advisory',
      executed_at: Time.now + 1.hour
    }
  end

  let!(:invalid_attributes) do
    {
      date:        nil,
      start_at:    Time.now,
      end_at:      Time.now + 2.hours,
      action:      '',
      origin:      'CRM',
      user_id:     user.id,
      destiny_url: FFaker::Internet.unique.http_url,
      notes:       FFaker::Lorem.unique.paragraphs,
      interested:  FFaker::Name.name,
      origin_id:   2,
      origin_type: '',
      executed_at: nil
    }
  end

  let!(:executed_at_attributes) do
    {
      action:      'Primeira_Visita',
      origin:      'CRM',
      user_id:     user.id,
      origin_id:   schedule.origin_id,
      executed_at: Time.zone.now + 2.hours
    }
  end

  before :each do
    sign_in user
  end

  describe 'GET #index' do
    it 'should return all schedules from current_user' do
      schedule1 = create(:schedule, user_id: user.id, slot_schedule_id: slot_schedule.id)
      schedule2 = create(:schedule, user_id: user.id, slot_schedule_id: slot_schedule.id)
      create(:schedule)

      get :index, params: {}

      expect(response.body).to include_json(
        [
          JSON.parse(ActiveModelSerializers::Adapter.create(ScheduleSerializer.new(schedule),  {}).to_json),
          JSON.parse(ActiveModelSerializers::Adapter.create(ScheduleSerializer.new(schedule1), {}).to_json),
          JSON.parse(ActiveModelSerializers::Adapter.create(ScheduleSerializer.new(schedule2), {}).to_json)
        ]
      )
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'should create a new schedule' do
        schedule = Schedule.new(valid_attributes)
        expect(schedule.id).to eq(valid_attributes[:id])
      end
    end

    context 'with invalid attributes' do
      it 'should not create a new schedule' do
        schedule = Schedule.new(invalid_attributes)
        expect(schedule.id).to eq(invalid_attributes[:id])
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'should update a schedule' do
        put :update, params: { schedule: valid_attributes, id: schedule.id }

        expect(Schedule.find(schedule.id).action).to     eq(valid_attributes[:action])
        expect(Schedule.find(schedule.id).interested).to eq(valid_attributes[:interested])
        expect(response).to                              have_http_status(:ok)
      end
    end

    context 'with invalid attributes' do
      it 'should not update a schedule' do
        put :update, params: { schedule: invalid_attributes, id: schedule.id }

        expect(Schedule.find(schedule.id).action).to eq(schedule.action)
        expect(response).to                          have_http_status(:unprocessable_entity)
      end
    end

    context 'when is not the owner' do
      it 'should not update a schedule' do
        user2                      = create(:user)
        valid_attributes[:user_id] = user2.id

        put :update, params: { schedule: valid_attributes, id: schedule.id }

        expect(Schedule.find(schedule.id).action).to eq(schedule.action)
        expect(Schedule.find(schedule.id).user).to   eq(schedule.user)
        expect(response).to                          have_http_status(:forbidden)
      end
    end

    context 'when update only executed_at' do
      it 'must update only the executed_at attribute' do
        put :update, params: { schedule: executed_at_attributes, id: schedule.id }
        expect(Schedule.find(schedule.id).executed_at.strftime('%d/%m/%Y %H:%M')).to eq((Time.zone.now + 2.hours).strftime('%d/%m/%Y %H:%M'))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the schedule exists' do
      it 'must delete the schedule' do
        expect { delete :destroy, params: { origin: schedule.origin, origin_id: schedule.origin_id, origin_type: schedule.origin_type, user_id: user.id } }.to change(Schedule, :count).by(-1)
      end
    end
  end
end
