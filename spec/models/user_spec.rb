# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'from_omniauth' do
    context 'given an auth object' do
      let!(:auth) do
        JSON.parse({
          uid:      '101',
          provider: 'test',
          info: {
            name:        'Jorge',
            email:       'jorge@webgoal.com.br',
            active_role: 'admin'
          },
          extra: {
            image: nil
          }
        }.to_json, object_class: OpenStruct)
      end

      it 'should return the user object' do
        user = User.from_omniauth(auth)

        expect(user.id).to    eq(auth.uid.to_i)
        expect(user.name).to  eq(auth.info.name)
        expect(user.email).to eq(auth.info.email)
        expect(user.image).to eq(auth.extra.image)
      end
    end
  end

  describe 'active_role_description' do
    context 'given an user' do
      context 'that is admin' do
        let!(:user) { create(:user) }

        it 'should return readable description' do
          expect(user.active_role_description).to eq('Administrador')
        end
      end

      context 'that is business_manager' do
        let!(:user) { create(:user, active_role: 'business_manager') }

        it 'should return readable description' do
          expect(user.active_role_description).to eq('Gerente Comercial')
        end
      end

      context 'that is educational_advisor' do
        let!(:user) { create(:user, active_role: 'educational_advisor') }

        it 'should return readable description' do
          expect(user.active_role_description).to eq('Assessor Educacional')
        end
      end

      context 'that is educational_manager' do
        let!(:user) { create(:user, active_role: 'educational_manager') }

        it 'should return readable description' do
          expect(user.active_role_description).to eq('Gerente Educacional')
        end
      end

      context 'that is entrepreneur' do
        let!(:user) { create(:user, active_role: 'entrepreneur') }

        it 'should return readable description' do
          expect(user.active_role_description).to eq('Empreendedor')
        end
      end

      context 'that is franchisor' do
        let!(:user) { create(:user, active_role: 'franchisor') }

        it 'should return readable description' do
          expect(user.active_role_description).to eq('Franqueador')
        end
      end

      context 'that is financial' do
        let!(:user) { create(:user, active_role: 'financial') }

        it 'should return readable description' do
          expect(user.active_role_description).to eq('Financeiro')
        end
      end

      context 'that is master_unity' do
        let!(:user) { create(:user, active_role: 'master_unity') }

        it 'should return readable description' do
          expect(user.active_role_description).to eq('Regional')
        end
      end

      context 'that is pole' do
        let!(:user) { create(:user, active_role: 'pole') }

        it 'should return readable description' do
          expect(user.active_role_description).to eq('Polo')
        end
      end

      context 'that is sales_consultant' do
        let!(:user) { create(:user, active_role: 'sales_consultant') }

        it 'should return readable description' do
          expect(user.active_role_description).to eq('Consultor de Vendas')
        end
      end
    end
  end
end
