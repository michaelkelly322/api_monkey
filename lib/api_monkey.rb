require "api_monkey/version"
require "api_monkey/filterable"
require "api_monkey/filter_scopes"

module ApiMonkey
  extend ActiveSupport::Concern
  include ApiMonkey::Filterable
  include ApiMonkey::FilterScopes
end
