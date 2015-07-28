Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers/random' => 'customers#random'

      resources :customers, except: [:new, :edit]
      resources :merchants, except: [:new, :edit]
      resources :items, except: [:new, :edit]
      resources :invoices, except: [:new, :edit]
      resources :transactions, execpt: [:new, :edit]
      resources :invoice_items, except: [:new, :edit]
    end
end
end


=begin

ApiDemoApp::Application.routes.draw do
  scope '/api' do
    scope '/v1' do
      scope '/projects' do
        get '/' => 'api_projects#index'
        post '/' => 'api_projects#create'
        scope '/:name' do
          get '/' => 'api_projects#show'
          put '/' => 'api_projects#update'
          scope '/todos' do
            get '/' => 'api_todos#index'
            post '/' => 'api_todos#create'
            scope '/:todo_name' do
              get '/' => 'api_todos#show'
              put '/' => 'api_todos#update'
            end
          end
        end
      end
=end

