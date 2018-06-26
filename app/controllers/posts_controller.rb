class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end
  
  def create
    Post.create(
      title: params[:title], #new에서 날라온 데이터
      content: params[:content]
      )
      redirect_to '/'
  end
  

  def show
    #해당하는 글 하나를 보여준다(/posts/show/999)
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id]) #show 와 edit 의 글 내용물은 같다
  end
  
  def update
    # /posts/update/1 => 해당 id를 가진 post 수정하겠다
    @post = Post.find(params[:id])
    @post.update(
      title: params[:title],
      content: params[:content]
      )
    redirect_to "/posts/show/#{@post.id}" #수술하려면 쌍따옴표!!
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end

end
