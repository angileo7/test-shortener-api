Rails.application.routes.draw do
  resources :urls
  match "/search" => "urls#navigate", :via => :post, :as => :search_original
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
