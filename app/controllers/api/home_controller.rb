# frozen_string_literal: true

module Api
  class HomeController < Api::ApiApplicationController
    skip_load_and_authorize_resource
  end
end
