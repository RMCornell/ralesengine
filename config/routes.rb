Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        get '/customers/random',    to: 'customers#random'
        get '/customers/find',      to: 'customers#find'
        get '/customers/find_all',  to: 'customers#find_all'

        get '/customers/:id/invoices',          to: 'customers#invoices'
        get '/customers/:id/transactions',      to: 'customers#transactions'
        get '/customers/:id/favorite_merchant', to: 'customers#favorite_merchant'
        resources :customers, only: [:index, :show]

        get '/invoice_items/random',    to: 'invoice_items#random'
        get '/invoice_items/find',      to: 'invoice_items#find'
        get '/invoice_items/find_all',  to: 'invoice_items#find_all'

        get 'invoice_items/:id/invoice',  to: 'invoice_items#invoice'
        get 'invoice_items/:id/item',     to: 'invoice_items#item'
        resources :invoice_items, only: [:index, :show]

        get 'items/random'                                  => 'items#random'
        get 'items/find', to: 'items#find'
        get 'items/find_all'                                => 'items#find_all'
        get 'items/most_revenue'                            => 'items#most_revenue'
        get 'items/most_items'                              => 'items#most_items'

        get 'items/:id/best_day'                            => 'items#best_day'
        get 'items/:id/invoice_items'                       => 'items#invoice_items'
        get 'items/:id/merchant'                            => 'items#merchant'
        resources :items, only: [:index, :show]


        get 'invoices/random'                               => 'invoices#random'
        get 'invoices/find'                                 => 'invoices#find'
        get 'invoices/find_all'                             => 'invoices#find_all'

        get 'invoices/:id/transactions'                     => 'invoices#transactions'
        get 'invoices/:id/invoice_items'                    => 'invoices#invoice_items'
        get 'invoices/:id/items'                            => 'invoices#items'
        get 'invoices/:id/customer'                         => 'invoices#customer'
        get 'invoices/:id/merchant'                         => 'invoices#merchant'
        resources :invoices, only: [:index, :show]


        get 'merchants/random'                              => 'merchants#random'
        get 'merchants/find'                                => 'merchants#find'
        get 'merchants/find_all'                            => 'merchants#find_all'
        get 'merchants/find_all/:name', to: 'merchants#find_all'
        get 'merchants/most_revenue'                        => 'merchants#most_revenue'
        get 'merchants/most_items'                          => 'merchants#most_items'
        get 'merchants/revenue'                             => 'merchants#revenue'

        get 'merchants/:id/customers_with_pending_invoices' => 'merchants#customers_with_pending_invoices'
        get 'merchants/:id/items'                           => 'merchants#items'
        get 'merchants/:id/invoices'                        => 'merchants#invoices'
        get 'merchants/:id/revenue'                         => 'merchants#revenue'
        get 'merchants/:id/revenue/:date', to: 'merchants#revenue'
        get 'merchants/:id/favorite_customer'               => 'merchants#favorite_customer'
        resources :merchants, only: [:index, :show]


        get 'transactions/random'                           => 'transactions#random'
        get 'transactions/find'                             => 'transactions#find'
        get 'transactions/find_all'                         => 'transactions#find_all'

        get 'transactions/:id/invoice'                      => 'transactions#invoice'
        resources :transactions, only: [:index, :show]
    end
end
end
