Rails.application.routes.draw do
  get 'uf/:date', to: "ufs#uf_request"
  get 'client/:name', to: "ufs#count_request"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
