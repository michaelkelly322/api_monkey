require 'test_helper'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests ApiMonkey::Generators::InstallGenerator
  destination File.expand_path('../../tmp', __FILE__)
  setup :prepare_destination

  test 'assert all files are properly created' do
    run_generator(['--orm=active_record'])
    assert_file 'config/initializers/api_monkey.rb', /api_monkey\/orm\/active_record/
  end

  test 'assert error on ORM other than active_record' do
    assert_raises ApiMonkey::Generators::NonARError do
      run_generator(['--orm=mongoid'])
    end
  end
end
