Rails.application.routes.draw do
  root "chatrooms#index"
  resources :chatrooms
  resources :chatrooms do
    resources :messages, controller: :chatroom_messages
  end
end
