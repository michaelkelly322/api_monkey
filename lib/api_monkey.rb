require "api_monkey/engine"

module ApiMonkey
  mattr_accessor :extend_orm
  @@extend_orm = true

  mattr_accessor :logger
  @@logger = Rails.logger

  mattr_accessor :warnings
  @@warnings = {
    override_resource_to_field_warning: true
  }

  def self.setup
    yield self
  end
end

require 'api_monkey/active_record_models'
