Teatercamp3::Application.routes.draw do

  get "credit_note/index"

  get "invoices/create"

  resources :products
  resources :users
  resources :sessions
  resources :registrations
  resources :camps
  resources :options
  resources :messages
  resources :categories
  resources :comments
  resources :data_files
  resources :invoices
  resource :session
  resources :posts
  resources :contacts

  resources :pages do
     get :move_higher, :on => :member
     get :move_lower, :on => :member
  end
 root :to => "public#index", :name => "Start"

 get "/logout" => 'sessions#destroy', :as => :logout
 get "login"  => 'sessions#new', :as => :login
 get "/register"  => 'users#create', :as => :register
 get "/signup"  => 'users#new', :as => :signup
 get "/view_emails" => 'registrations#emails', :as => :emails
 get "/set_paid/:id" => 'invoices#set_paid', :as => :set_paid
 # get "/category/:id" => 'public#category', :as => :category
 get "/comments/set_status" => "comments#set_status"
 get "/cms" => 'home#index', :as => :cms
 get "/view_blogg" => 'public#blogg', :as => :view_blogg
 get "/view_camps" => 'public#camps', :as => :view_camps
 get "/view_camp/:id" => 'public#view_camp', :as => :view_camp
 get "/view_page" => 'public#index', :as => :view_page
 get "/add_comment/:id" => "public#add_comment", :as => :add_comment
 get "/view_post" => 'public#view_post', :as => :title
 get 'view/:name' => 'public#view', :as => :view_special
 get 'invoice_send/:id' => 'invoices#invoice_send', :as => :invoice_send
 get 'send_reminder/:id' => 'invoices#reminder_send', :as => :send_reminder
 get 'send_creditnote/:id' => 'invoices#send_creditnote', :as => :send_creditnote
 get 'download_pdf/:id' => 'invoices#download_pdf', :as => :download_pdf
 get 'show_pdf/:id' => 'invoices#show_pdf', :as => :show_pdf
 get 'all_invoices' => 'invoices#all_invoices', :as => :all_invoices
 get 'credit_note/:id' => 'invoices#credit_note', :as => :credit_note
 get 'show_credit_note/:id' => 'invoices#show_credit_note', :as => :show_credit_note
 post '/totals' => 'invoices#totals', :as => :totals
 get '/totals' => 'invoices#totals'







end
