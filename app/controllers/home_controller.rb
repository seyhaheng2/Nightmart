class HomeController < ApplicationController

  def index
    search = params[:query]
    if search.present?
      @posts = Post.text_search(search)
        .paginate(:page => params[:page], :per_page => 12)
    else
      cate_id = params[:id]
      if cate_id
        @posts = Post.in_category(cate_id)
          .paginate(:page => params[:page], :per_page => 12)
      else
        @posts = Post.all.paginate(:page => params[:page], :per_page => 4)
      end
    end
  end

  def show
  	@post = Post.find(params[:id])
  	count = @post.countclick + 1
  	@post.update_attributes(:countclick => count)
  end

end
