module ApiMonkey::FilterScopes
  extend ActiveSupport::Concern

  OPERANDS = {
    'eq' => '=',
    'gt' => '>',
    'lt' => '<',
    'geq' => '>=',
    'leq' => '<=',
  }.freeze

  included do
    # Define filter methods
    column_names.map do |field_name|
      define_singleton_method "filter_#{field_name}" do |param|
        if param.is_a? Hash
          where(*process_hash_params(field_name, param))
        else
          where(*filter_args(field_name, param, 'eq'))
        end
      end
    end

    def self.filter_args(field, value, op)
      ["#{field} #{OPERANDS[op]} ?", value]
    end

    def self.process_hash_params(field, param)
      predicates, values = [],[]
      param.keys.each do |k|
        predicates << filter_args(field, param[k], k)[0]
        values << filter_args(field, param[k], k)[1]
      end

      [predicates.join(' AND '), *values]
    end

    def self.filter_params
      {}.tap do |h|
        column_names.each do |field_name|
          h[field_name.to_sym] = OPERANDS.keys.map &:to_sym
        end
      end
    end
  end
end
