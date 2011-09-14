class InvoiceMailer < ActionMailer::Base
  default :from => "info@teatercamp.no"
  
  def send_invoice(invoice)
    @invoice = invoice
    @registration = @invoice.registration
    @camp = @registration.camp
    html = render_to_string(:action => "../invoices/show_pdf.html.erb") 
     mail(:to => @registration.billing_email, :subject => "Faktura") do |format|
      format.text
      format.html
      format.pdf do
        attachments['faktura.pdf'] = PDFKit.new(html).to_pdf
      end
    end
  end
  def send_reminder(invoice)
    @invoice = invoice
    @registration = @invoice.registration
    @camp = @registration.camp
    html = render_to_string(:action => "../invoices/show_pdf.html.erb") 
     mail(:to => @registration.billing_email, :subject => "Påminnelse") do |format|
      format.text
      format.html
      format.pdf do
        attachments['faktura.pdf'] = PDFKit.new(html).to_pdf
      end
    end
  end
  
  
end
