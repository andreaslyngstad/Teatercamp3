# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def markdown(text)
    Redcarpet.new(text).to_html.html_safe
  end
  
 def total(invoices)
     total    = 0
     vat      = 0
     eks_vat  = 0
     invoices.each do |i|
       total    += i.registration.camp.products.sum(:total_price)
       vat      += i.registration.camp.total_vat
       eks_vat  += i.registration.camp.total_eks_vat
     end
     [total, vat, eks_vat]
   end
  
  def render_error_messages(*objects)
    messages = objects.compact.map { |o| o.errors.full_messages}.flatten
    render :partial => 'shared/error_message', :object => messages unless messages.empty?
  end
def logged_in? 
    unless session[:user_id] 
      return false 
    else 
      return true 
    end 
  end
end
