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

      get '/items/random' => 'items#random'
      get '/items/find' => 'items#find'
      get '/items/find_all' => 'items#find_all'

      get '/invoices/random' => 'invoices#random'
      get '/invoices/find' => 'invoices#find'
      get '/invoices/find_all' => 'invoices#find_all'

      get '/merchants/random' => 'merchants#random'
      get '/merchants/find' => 'merchants#find'
      get '/merchants/find_all' => 'merchants#find_all'

      get '/transactions/random' => 'transactions#random'
      get '/transactions/find' => 'transactions#find'
      get '/transactions/find_all' => 'transactions#find_all'



      get 'merchants/:id/items' => 'merchants#items'



      resources :customers, except: [:new, :edit]
      resources :merchants, except: [:new, :edit]
      resources :items, except: [:new, :edit]
      resources :invoices, except: [:new, :edit]
      resources :transactions, execpt: [:new, :edit]
      resources :invoice_items, except: [:new, :edit]
    end
end
end
