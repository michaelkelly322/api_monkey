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
      # I want to replace this right here...use polymorphism to build this string
      # something like Operand.lookup(op).query_for(value) which would ultimately
      # call `where` or `join().where` in the case of relationship filtering
      if op == 'in'
        ["#{field} in (?)", value]
      else
        ["#{field} #{OPERANDS[op]} ?", value]
      end
    end

    def self.process_hash_params(field, param)
      predicates, values = [],[]
      param.keys.each do |k|
        # TODO: in this situation we may have a relationship's field
        # we need to determine how this is going to be represented
        # in the URL and parameters that `filter` is expecting
        # I think that we can get away with '.' in the fieldname param,
        # The main worry was that HashWithIndifferentAccess might not support
        # this since '.' is not supported in symbols, we'll try and see what the
        # hell happens LOL
        # confirmed, using `relation.field` as the field param should work if we
        # just pivot it using the existance of '.' in the name, use the first to
        # construct the join/include statement and the query string
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
