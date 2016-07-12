module ApiMonkey::Filterable
  extend ActiveSupport::Concern

  included do
    define_singleton_method :filter do |filtering_params|
      results = self.where(nil)
      return results unless filtering_params
      filtering_params.each do |key, value|
        results = if key.split('.').count > 1
                    results.public_send(:filter_related, key, value)
                  else
                    results.public_send("filter_#{key}", value)
                  end
      end
      results
    end
  end
end

