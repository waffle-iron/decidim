# frozen_string_literal: true
module Decidim
  module Admin
    # The main application controller that inherits from Rails.
    class ApplicationController < ActionController::Base
      include NeedsOrganization
      include Pundit
      protect_from_forgery with: :exception, prepend: true

      after_action :verify_authorized

      def policy(record)
        policies[record] ||= policy_class.new(current_user, record)
      end
    end
  end
end
