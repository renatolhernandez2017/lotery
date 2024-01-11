# frozen_string_literal: true

module Api
  class ApiApplicationController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    skip_before_action :authenticate_user!, raise: false
    skip_before_action :verify_authenticity_token

    protected

    def record_not_found
      head :not_found
    end
  end
end
