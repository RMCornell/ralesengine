Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers/random' => 'customers#random'
      get '/customers/find' => 'customers#find'
      get '/customers/find_all' => 'customers#find_all'

      get '/invoice_items/random' => 'invoice_items#random'
      get '/invoice_items/find' => 'invoice_items#find'
      get '/invoice_items/find_all' => 'invoice_items#find_all'

      get '/invoices/random' => 'invoices#random'
      get '/invoices/find' => 'invoices#find'
      get '/invoices/find_all' => 'invoices#find_all'

      resources :customers, except: [:new, :edit]
      resources :merchants, except: [:new, :edit]
      resources :items, except: [:new, :edit]
      resources :invoices, except: [:new, :edit]
      resources :transactions, execpt: [:new, :edit]
      resources :invoice_items, except: [:new, :edit]
    end
end
end
