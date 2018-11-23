class PublicController < ApplicationController
  skip_before_filter :login_required?
  before_filter :set_all_categories,
                :instantiate_controller_and_action_names
                # :get_pages_for_tabs, :get_sub_tabs

  layout "public"

  def index
    @posts = Post.search(params[:search])
    # @parents = Page.roots
    @pages = Page.where(name:[ 'Teater|camp', 'Film|camp', 'Om oss']).order("lft")
    @option = Option.first
    @camps = Camp.where(:public => true)
     if params[:id]
     @camp = Camp.find(params[:id])
     end

  end

  def start
  end
  def view
    @page = Page.find_by_name(params[:name])
    # @parents = Page.roots
    @option = Option.first
  end

  def tag
    @tag = Tag.find(params[:id])
    @posts = Post.find_tagged_with(@tag, :include => [:author, :comments],
    :order => "posts.created_at DESC", :conditions => "status = 'Offentlig'")
    @posts_til_liste = Post.eager_post
    render(:action => 'blogg')
  end

  def blogg
    @option = Option.first
    @posts = Post.search(params[:search])
    @posts_til_liste = Post.eager_post
    respond_to do |format|
      format.html
      format.rss {render :layout => false}
    end
  end

  def view_post
    @option = Option.first
    @post = Post.find(params[:id], :include => [:author, :categories])
    @posts_til_liste = Post.eager_post
    render(:template => 'shared/view_post')

  end

  def add_comment
    @option = Option.first
    @parents = Page.roots
    @posts_til_liste = Post.eager_post
    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:id])
    @comment.post = @post
    @comment.status = "nye"
    if @comment.save
      flash[:notice] = "Du har lagt til en kommentar."
      redirect_to(:action => "view_post", :id => @post.id)
    else
      flash[:error] = "Obs! Du skrive navn, gyldig epost og en kommentar. Prøv igjen."
      render(:template => 'shared/view_post')
    end


  end

   def category
     @option = Option.first
    @parents = Page.roots
     @posts_til_liste = Post.eager_post
    @posts = Post.find(:all, :include => [:author, :categories],
    :conditions => ["status = 'Offentlig' AND categories.id = ?", params[:id]],
    :order => "posts.created_at DESC")

    render(:action => 'blogg')

  end
   def camps
     @option = Option.first
     @camps = Camp.where(:public => true)
     if params[:id]
     @camp = Camp.find(params[:id])
     end
   end
  def view_camp
    @pages = Page.order("lft")
    @option = Option.first
    @camp = Camp.find(params[:id])
    render(:layout => 'camps')
  end

end
