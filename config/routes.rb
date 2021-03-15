Rails.application.routes.draw do
  get 'users/search' => 'searches#search'
end
