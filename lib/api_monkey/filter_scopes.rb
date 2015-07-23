module ApiMonkey::FilterScopes
  extend ActiveSupport::Concern

  included do
    column_names.map do |field_name|
      define_singleton_method "filter_#{field_name}" do |param|
        where("#{field_name} = ?", param)
      end
    end
  end
end
