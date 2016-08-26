ApiMonkey.setup do |config|
  # ==> General Settings
  # By default ApiMonkey uses `Rails.logger` for logging, however you may use any
  # logger by passing an instance of it to `config.logger`
  config.logger = Rails.logger

  # ==> ORM confirguration
  # By default ApiMonkey uses ActiveSupport hooks to inject model modules.
  # default is true. If set to false no models will be included as resources
  # by default and you will have to add `extend ApiMonkey::ActiveRecordModels`
  # to any model you want included.
  config.extend_orm = true

  # load orm specific modules, currently only functions with active_record
  require 'api_monkey/orm/<%= options[:orm] %>'
end
