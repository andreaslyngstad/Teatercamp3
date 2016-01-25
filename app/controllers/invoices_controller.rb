class InvoicesController < ApplicationController
  layout :resolve_layout
  
  def index
    @invoices = Invoice.includes([:registration, :credit_note, {:registration => [{:camp=> [:products]}]}])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoices }
    end
  end
  
  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end
  def show_pdf
   
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end
  
  def create
    @invoice = Invoice.new(params[:Invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to(@invoice, :notice => 'Invoice was successfully created.') }
        format.xml  { render :xml => @invoice, :status => :created, :location => @invoice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def invoice_send
    @invoice = Invoice.find(params[:id])
    @invoice.made_date = Time.now
    @invoice.pay_by = Time.now + 14.days
    @invoice.sent = true
    @invoice.save
     respond_to do |wants|
       if InvoiceMailer.send_invoice(@invoice).deliver
       wants.js 
     end
     end
  end
  
  def reminder_send
    @invoice = Invoice.find(params[:id])
    @invoice.reminder_date = Time.now
    @invoice.save
    respond_to do |wants|
       if InvoiceMailer.send_reminder(@invoice).deliver
       wants.js 
     end
     end
  end
  def set_paid
     @invoice = Invoice.find(params[:id])
    if @invoice.paid == true
      @invoice.paid = false
    else
      @invoice.paid = true
    end
    respond_to do |format|
      if @invoice.save
        format.js 
        
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end
  def credit_note
    @invoice = Invoice.find(params[:id])
    @credit_note = CreditNote.new
    @credit_note.invoice = @invoice
    @credit_note.total = -(@invoice.registration.camp.products.sum(:total_price))
    @credit_note.save
    redirect_to(invoices_path)
  end
  def totals
    if !params[:year].nil?
      start_time = (params[:year]).values.join("-").to_time
    else
    start_time = Time.now
    end
    @time = start_time
    @invoices = Invoice.where(:paid => true, :made_date => start_time.beginning_of_year..start_time.end_of_year)
  end
    def resolve_layout
    case action_name
    when "show_pdf"
      "pdf_layout"
    else
      "application"
    end
  end
end
