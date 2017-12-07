Rails.application.routes.draw do
  resources :schedules
  resources :athletes
  resources :sports
  resources :schedule
  get 'welcome/athletes'

  get 'welcome/schedule'
#  get '/schedules(.:format)' => 'schedules#show'

  get 'welcome/sports'

  get 'welcome/Index'
  root 'welcome#Index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
