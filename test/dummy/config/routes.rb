Rails.application.routes.draw do
  mount ApiMonkey::Engine => "/api_monkey"
end
