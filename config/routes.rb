Rails.application.routes.draw do
  resources :chatrooms
  resources :chatrooms do
    resources :messages, controller: :chatroom_messages
  end
end
