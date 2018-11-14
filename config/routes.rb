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

 match "/logout" => 'sessions#destroy', :as => :logout
 get "login"  => 'sessions#new', :as => :login
 match "/register"  => 'users#create', :as => :register
 match "/signup"  => 'users#new', :as => :signup
 match "/view_emails" => 'registrations#emails', :as => :emails
 match "/set_paid/:id" => 'invoices#set_paid', :as => :set_paid
 match "/category/:id" => 'public#category', :as => :category
 match "/comments/set_status" => "comments#set_status"
 match "/cms" => 'home#index', :as => :cms
 match "/view_blogg" => 'public#blogg', :as => :view_blogg
 match "/view_camps" => 'public#camps', :as => :view_camps
 match "/view_camp/:id" => 'public#view_camp', :as => :view_camp
 match "/view_page" => 'public#index', :as => :view_page
 match "/add_comment/:id" => "public#add_comment", :as => :add_comment
 match "/view_post" => 'public#view_post', :as => :title
 match 'view/:name' => 'public#view', :as => :view_page
 match 'invoice_send/:id' => 'invoices#invoice_send', :as => :invoice_send
 match 'send_reminder/:id' => 'invoices#reminder_send', :as => :send_reminder
 match 'send_creditnote/:id' => 'invoices#send_creditnote', :as => :send_creditnote
 match 'download_pdf/:id' => 'invoices#download_pdf', :as => :download_pdf
 match 'show_pdf/:id' => 'invoices#show_pdf', :as => :show_pdf
 match 'credit_note/:id' => 'invoices#credit_note', :as => :credit_note
 match 'show_credit_note/:id' => 'invoices#show_credit_note', :as => :show_credit_note
 match '/totals' => 'invoices#totals', :as => :totals







end
