Rails.application.routes.draw do
  root to: ->(_) { [400, {}, ['']] }
  resources :messages, only: [:index]
end
