require 'api_monkey/orm/active_record'

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.logger = Logger.new(nil)
ActiveRecord::Base.include_root_in_json = true

class ActiveSupport::TestCase
  self.use_transactional_tests   = true
  self.use_instantiated_fixtures = false
end
