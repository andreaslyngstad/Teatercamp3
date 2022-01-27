class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all # include all helpers, all the time

  before_action :login_required?, :instantiate_controller_and_action_names, :options
  helper_method :current_user


  def options
    if Option.first.nil?
      @app_name = ""
      @meta_key = "andaly"
      @meta_des = "andaly"
      @css  = "design_1"
    else
      option = Option.first
      @app_name = option.app_name
      @meta_key = option.meta_keywords
      @meta_des = option.meta_description
      @css  = option.css.to_s
      @owner = option.owner_name
      @account = option.account
      @vat = option.vat_number
    end
  end

  def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
  end

  def set_all_categories
    @all_categories = Category.order 'name ASC'
  end


  def instantiate_controller_and_action_names
     @current_action = action_name
     @current_controller = controller_name
  end




  # def get_pages_for_tabs
  #   @tabs = Page.find_main
  # end
  #
  #  def get_sub_tabs
  #     @subtabs = Page.find_subpages
  #  end


 protected

  def login_required?
      unless session[:user_id]
        flash[:notice] = "You need to log in first."
        redirect_to login_path
        return false
      else
        return true
      end
  end
private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
end
