require 'rails/generators/base'

module ApiMonkey
  module Generators
    NonARError = Class.new(StandardError)

    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates an ApiMonkey initializer'
      class_option :orm

      def copy_initializer
        if options[:orm] != 'active_record'
          raise NonARError, <<-ERROR
          Currently the only ORM supported by ApiMonkey is ActiveRecord.

          Be sure to have ActiveRecord loaded in your app.
          ERROR
        end

        template 'api_monkey.rb', 'config/initializers/api_monkey.rb'
      end

    end
  end
end
