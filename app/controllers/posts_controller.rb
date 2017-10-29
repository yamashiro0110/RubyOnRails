class PostsController < ApplicationController
  include Swagger::Blocks

  def new
  end

  # ********************
  swagger_path '/posts' do
    operation :get do
      key :summary, 'post list'
      key :description, 'return post list'
      key :operationId, 'findPostSummary'
      key :produces, ['application/json', 'text/html']
      key :tags, ['post']
      response 200 do
        key :description, 'post summary response'
        schema do
          key :type, :array
          items do
            key :'$ref', :Post
          end
        end
      end
    end
  end

  def index
    @posts = Post.all

    respond_to do |format|
      format.html
      format.json {render :json => @posts}
    end
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  # ********************
  swagger_path '/posts/{id}' do
    operation :get do
      key :summary, 'find post by id'
      key :description, 'return single post'
      key :operationId, 'findPostById'
      key :tags, ['post']
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'id of post'
        key :required, true
        key :type, :integer
        key :format, :int64
        schema do
          key :'$ref', :Post
        end
      end
      response 200 do
        key :description, 'post response'
        schema do
          key :'$ref', :Post
        end
      end
      response 400 do
        key :description, 'bad request'
        schema do
          key :'$ref', :ErrorResponse
        end
      end
      response 500 do
        key :description, 'server error'
        schema do
          key :'$ref', :ErrorResponse
        end
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :json => @post}
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end

end
