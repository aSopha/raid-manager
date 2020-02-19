Rails.application.routes.draw do
  resources :rosters, :players, only: [:index, :new, :show, :update, :destroy, :create, :edit, :update]
  root :to => "index#index"
end
