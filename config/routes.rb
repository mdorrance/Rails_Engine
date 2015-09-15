Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        get "/merchants/find", to: "merchants#find"
        get "/customers/find", to: "customers#find"
        get "/invoice_items/find", to: "invoice_items#find"
        get "/invoices/find", to: "invoices#find"
        get "/items/find", to: "items#find"
        get "/transactions/find", to: "transactions#find"

        get "/merchants/find_all", to: "merchants#find_all"
        get "/customers/find_all", to: "customers#find_all"
        get "/invoice_items/find_all", to: "invoice_items#find_all"
        get "/invoices/find_all", to: "invoices#find_all"
        get "/items/find_all", to: "items#find_all"
        get "/transactions/find_all", to: "transactions#find_all"

        get "/merchants/random", to: "merchants#random"
        get "/customers/random", to: "customers#random"
        get "/invoice_items/random", to: "invoice_items#random"
        get "/invoices/random", to: "invoices#random"
        get "/items/random", to: "items#random"
        get "/transactions/random", to: "transactions#random"

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
