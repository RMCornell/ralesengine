Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show] do
        get '/random' => 'customers#random'
        get '/find' => 'customers#find'
        get '/find_all' => 'customers#find_all'

        get '/:id/invoices' => 'customers#invoices'
        get '/:id/transactions' => 'customers#transactions'
        get '/:id/favorite_merchant' => 'customers#favorite_merchant'
      end

      resources :invoice_items, only: [:index, :show] do
        get '/random' => 'invoice_items#random'
        get '/find' => 'invoice_items#find'
        get '/find_all' => 'invoice_items#find_all'

        get '/:id/invoice' => 'invoice_items#invoice'
        get '/:id/item' => 'invoice_items#item'
      end

      resources :items, only: [:index, :show] do
        get '/random' => 'items#random'
        get '/find' => 'items#find'
        get '/find_all' => 'items#find_all'
        get '/most_revenue' => 'items#most_revenue'

        get '/:id/invoice_items' => 'items#invoice_items'
        get '/:id/merchant' => 'items#merchant'
      end

      resources :invoices, only: [:index, :show] do
        get '/random' => 'invoices#random'
        get '/find' => 'invoices#find'
        get '/find_all' => 'invoices#find_all'

        get '/:id/transactions' => 'invoices#transactions'
        get '/:id/invoice_items' => 'invoices#invoice_items'
        get '/:id/items' => 'invoices#items'
        get '/:id/customer' => 'invoices#customer'
        get '/:id/merchant' => 'invoices#merchant'
      end

      resources :merchants, only: [:index, :show] do
        get '/random' => 'merchants#random'
        get '/find' => 'merchants#find'
        get '/find_all' => 'merchants#find_all'
        get '/most_revenue' => 'merchants#most_revenue'
        get '/most_items' => 'merchants#most_items'
        get '/revenue' => 'merchants#revenue'

        get '/:id/customers_with_pending_invoices' => 'merchants#customers_with_pending_invoices'
        get '/:id/items' => 'merchants#items'
        get '/:id/invoices' => 'merchants#invoices'
        get '/:id/revenue' => 'merchants#revenue'
        get '/:id/favorite_customer' => 'merchants#favorite_customer'
      end

      resources :transactions, only: [:index, :show] do
        get '/random' => 'transactions#random'
        get '/find' => 'transactions#find'
        get '/find_all' => 'transactions#find_all'

        get '/:id/invoice' => 'transactions#invoice'
      end
    end
end
end
