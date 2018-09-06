Rails.application.routes.draw do

  devise_for :users, path: "user/auth", controllers: {sessions: "sessions"}

  root "chat#index"

end
