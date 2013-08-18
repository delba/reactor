Reactor::Application.routes.draw do
  root 'people#index'
  get  'events', to: 'people#events'
end
