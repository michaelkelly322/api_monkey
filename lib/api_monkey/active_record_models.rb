module ApiMonkey
  module ActiveRecordModels
    cattr_accessor :is_api_monkey_resource
    @@is_api_monkey_resource = true

    def fields_from_table

    end

    def fields_to_table
      unless respond_to?(:super)
        emit_overrode_warning
      end

      fields_from_table.without([:id, :created_at, :updated_at])
    end

    def emit_override_warning
      if ApiMonkey.warnings[:override_resource_to_field_warning]
        ApiMonkey.logger.warn(default_to_table_message)
      end
    end

    def default_to_table_message
      "[ApiMonkey] By default ApiMonkey will expose all database fields" \
        "of a resource to being edited except :id, :created_at, :updated_at. It is recommended" \
        "to override `fields_to_table` in your models to control what fields are writable" \
        "through the generated APIs:" \
        "" \
        "  # exclusive approach" \
        "  def fields_to_table" \
        "    super.without([:password_hash, :last_login_at])" \
        "  end"
    end
  end
end
