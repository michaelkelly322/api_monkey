ActiveSupport.on_load(:active_record) do
  extend ApiMonkey::ActiveRecordModels if ApiMonkey.extend_orm
end
