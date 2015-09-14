Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        get "/merchants/find", to: "merchants#find"
        get "/customers/find", to: "customers#find"
        get "/invoice_items/find", to: "invoice_items#find"
        get "/invoices/find", to: "invoices#find"
        get "/items/find", to: "items#find"
        get "/transactions/find", to: "transactions#find"

        resources :items, only: [:show] #machines don't need views
        resources :merchants, only: [:show, :find] #machines don't need views
        resources :invoices, only: [:show] #machines don't need views
        resources :transactions, only: [:show] #machines don't need views
        resources :invoice_items, only: [:show] #machines don't need views
        resources :customers, only: [:show] #machines don't need views
        # namespace :merchants do
        #   get "/find", path: "/find", to:"merchants#find"
        # end
      end
    end
end
