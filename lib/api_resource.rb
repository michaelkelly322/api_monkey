require "api_resource/version"
require "api_resource/filterable"
require "api_resource/filter_scopes"

module ApiResource
  extend ActiveSupport::Concern
  include ApiResource::Filterable
  include ApiResource::FilterScopes
end
