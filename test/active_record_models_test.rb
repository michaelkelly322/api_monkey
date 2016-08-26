require 'test_helper'
require 'test_models'

class ActiveRecordTest < ActiveSupport::TestCase
  test 'assert creates #is_api_monkey_resource' do
    assert_respond_to ActiveRecordResource, :is_api_monkey_resource
  end

  test 'assert creates #fields_from_table' do
    assert_respond_to ActiveRecordResource, :fields_from_table
  end

  test 'assert creates #fields_to_table' do
    assert_respond_to ActiveRecordResource, :fields_to_table
  end
end
