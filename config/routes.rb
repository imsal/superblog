Rails.application.routes.draw do

  post '/subscribe', to: 'subscribe#create'


  # resources :subscribers, only: %i[new create update edit destroy]

  # get 'errors/not_found'
  # get 'errors/unacceptable'
  # get 'errors/internal_error'
  # get 'not_found/unacceptable'
  # get 'not_found/internal_error'
  # localhost:3000/

  root 'welcome#index'

  # localhost:3000/dashboard/
  scope :dashboard do
    # only viewable to admin
    get '/', to: 'dashboard#index', as: 'dashboard'
    get '/tags', to: 'dashboard#tags', as: 'dashboard_tags'
    resources :posts, param: :slug, except: :show
    delete :delete_attachment, to: 'attachment_control#delete_attachment', as: 'delete_attachment'
    resources :categories, param: :slug, except: :show
    resources :inquiries, only: %i[index new create destroy]
    # resources :subscribers, only: %i[index edit destroy]
    # get '/subscribers', to: 'subscribers#index'
      end

  ### Resetting resources here

  # localhost:3000/article/2018/09/12/some-title
  # scope :article do
    # /article/some-time-of-an-article
    # get '/article/:year/:month/:day/:slug', to: 'display#post', as: 'display_post'
    get '/article/:slug', to: 'display#post', as: 'display_post'
    get '/category/:slug', to: 'display#category', as: 'display_category'
    get '/tag/:tag_name', to: 'display#tags', as: 'tag'
  # end

  # scope :search do
    # get '/', to: "display#search"
    # get '/date/:year', to: 'display#date'
    # get '/date/:year/:month', to: 'display#date'
    # get '/date/:year/:month/:day', to: 'display#date'
  # end

  # 404s not found pages, but allows for rails blobs
  match '*unmatched', to: 'application#route_not_found', via: :all, constraints: lambda { |request| !request.url.include?('rails') }

end
