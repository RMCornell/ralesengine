Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers/random' => 'customers#random'
      get '/customers/find' => 'customers#find'
      get '/customers/find_all' => 'customers#find_all'

      get '/invoice_items/random' => 'invoice_items#random'
      get '/invoice_items/find' => 'invoice_items#find'
      get '/invoice_items/find_all' => 'invoice_items#find_all'

      get '/invoice_items/:id/invoice' => 'invoice_items#invoice'
      get '/invoice_items/:id/item' => 'invoice_items#item'

      get '/invoices/random' => 'invoices#random'
      get '/invoices/find' => 'invoices#find'
      get '/invoices/find_all' => 'invoices#find_all'

      get '/items/random' => 'items#random'
      get '/items/find' => 'items#find'
      get '/items/find_all' => 'items#find_all'

      get '/items/:id/invoice_items' => 'items#invoice_items'
      get '/items/:id/merchant' => 'items#merchant'

      get '/invoices/random' => 'invoices#random'
      get '/invoices/find' => 'invoices#find'
      get '/invoices/find_all' => 'invoices#find_all'

      get '/invoices/:id/transactions' => 'invoices#transactions'
      get '/invoices/:id/invoice_items' => 'invoices#invoice_items'
      get '/invoices/:id/items' => 'invoices#items'
      get '/invoices/:id/customer' => 'invoices#customer'
      get '/invoices/:id/merchant' => 'invoices#merchant'

      get '/merchants/random' => 'merchants#random'
      get '/merchants/find' => 'merchants#find'
      get '/merchants/find_all' => 'merchants#find_all'

      get '/merchants/:id/items' => 'merchants#items'
      get '/merchants/:id/invoices' => 'merchants#invoices'

      get '/transactions/random' => 'transactions#random'
      get '/transactions/find' => 'transactions#find'
      get '/transactions/find_all' => 'transactions#find_all'



      resources :customers, only: [:index, :show]
      resources :merchants, only: [:index, :show]

      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
end
end
