class OptionsController < ApplicationController
  # GET /options
  # GET /options.xml
  def index

   @option = Option.first if !Option.first.nil?
    @option = Option.new if @option.nil?
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @options }
    end
  end

  def create
    @option = Option.new(option_params)

    respond_to do |format|
      if @option.save
        flash[:notice] = 'Innstillingene ble lagret.'
        format.html { redirect_to(options_path) }
        format.xml  { render :xml => @option, :status => :created, :location => @option }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /options/1
  # PUT /options/1.xml
  def update
    @option = Option.find(params[:id])

    respond_to do |format|
      if @option.update_attributes(option_params)
        flash[:notice] = 'De nye innstillingene ble lagret.'
        format.html { redirect_to(options_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.xml
  def destroy
    @option = Option.find(params[:id])
    @option.destroy

    respond_to do |format|
      format.html { redirect_to(options_url) }
      format.xml  { head :ok }
    end
  end
  def option_params
      params.require(:option).permit(:app_name, :css,:owner_name,:meta_description,
        :meta_keywords,
        :quote1,
        :quote2,
        :quote3,
        :quote4,
        :account,
        :vat_number)
  end
end
