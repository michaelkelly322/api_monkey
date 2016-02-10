module ApiMonkey::Filterable
  extend ActiveSupport::Concern

  included do
    define_singleton_method :filter do |filtering_params|
      results = self.where(nil)
      return results unless filtering_params
      filtering_params.each do |key, value|
        # TODO: we need to remove the creation of these mini-methods in favor of defining a single method
        # on the model that allows us to pass in the key and value to support complex keys like `product.name`
        # versus just `name`
        results = results.public_send("filter_#{key}", value) if value.present?
      end
      results
    end
  end
end

