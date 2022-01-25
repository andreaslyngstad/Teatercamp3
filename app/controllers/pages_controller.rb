class PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml


  def index
    @pages = Page.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }

    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Den nye siden ble lagret.'
        format.html { redirect_to(@page) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update(page_params)
        flash[:notice] = 'Siden ble oppdatert.'
        format.html { redirect_to(@page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def move_higher
    @page = Page.find(params[:id])

    if @page.move_higher
      flash[:notice] = "Siden ble flyttet!"
    else
      flash[:notice] = "Du kan ikke flytte denne siden høyere"
    end

    redirect_to pages_path
  end


  def move_lower
    @page = Page.find(params[:id])

    if @page.move_lower
      flash[:notice] = "Siden ble flyttet!"
    else
      flash[:notice] = "Du kan ikke flytte denne siden lavere"
    end

    redirect_to pages_url
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
  def page_params
      params.require(:page).permit(
        :name,:title,:body,
        :parent_id,
        :navlabel,
        :lft,
        :rgt,
        :proposed_parent_id,
        :nav_photo_file_name,
        :nav_photo_content_type,
        :nav_photo_file_size,
        :nav_photo_updated_at,
        :main_photo_file_name,
        :main_photo_content_type,
        :main_photo_file_size,
        :main_photo_updated_at
      )
    end
end
