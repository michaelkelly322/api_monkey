module ApiMonkey
  class Engine < ::Rails::Engine
    isolate_namespace ApiMonkey

    config.api_monkey = ApiMonkey
  end
end
