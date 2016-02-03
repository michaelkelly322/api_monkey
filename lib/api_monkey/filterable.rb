module ApiMonkey::Filterable
  extend ActiveSupport::Concern

  included do
    define_singleton_method :filter do |filtering_params|
      results = self.where(nil)
      return results unless filtering_params
      filtering_params.each do |key, value|
        results = results.public_send("filter_#{key}", value) if value.present?
      end
      results
    end
  end
end

