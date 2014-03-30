AlgaeSite::Application.routes.draw do

  devise_for :users

  namespace :admin do
    scope '/:for_locale', constraints: { for_locale: /(#{I18n.available_locales.join('|')})/ } do
      root 'base#index'
      resources :pages
      resources :page_groups
      resources :images
      resources :menus
      resources :statics
      resources :uploads
    end

    get '/', to: redirect("/admin/#{I18n.default_locale}")
  end

  root to: redirect('/home')

  scope '(:locale)', constraints: { locale: /(#{I18n.available_locales.join('|')})/ } do

    get '/', to: redirect('/%{locale}/home')

    scope module: :static do
      get :home
      get :sitemap
    end

    resources :pages, only: [ :show ]
    resources :page_groups, path: '', only: [ :show ]
    resources :statics, path: '', only: [ :show ]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
