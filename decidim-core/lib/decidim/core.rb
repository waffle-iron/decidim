# frozen_string_literal: true
require "decidim/core/engine"
require "decidim/core/version"

# Decidim configuration.
module Decidim
  autoload :TranslatableAttributes, "decidim/translatable_attributes"
  autoload :FormBuilder, "decidim/form_builder"

  @config = OpenStruct.new

  def self.setup
    yield(@config)
  end

  def self.config
    @config
  end
end
