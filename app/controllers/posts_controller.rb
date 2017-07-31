class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @disable_nav = true
    if user_signed_in?
      if params[:tag]
        @posts = Post.tagged_with(params[:tag])
      else
        @posts = Post.all
  	  end
    else
      redirect_to new_user_session_path
    end
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @disable_nav = true
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  # GET /posts/new
  def new
    @disable_nav = true
    if user_signed_in?
      @post = Post.new
      @user_id = current_user.id
      @group_id = params[:id]
      if params[:id]
        @require_group_id = false
      end
    else
      redirect_to new_user_session_path
    end
  end

  # GET /posts/1/edit
  def edit
    @disable_nav = true
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, notice: 'You have successfully joined this group.') }#controller: groups, action: show, id: 16 }#group_path(16)}#(post_params[:group_id])}#, notice: 'Post was successfully created.' }
        #format.html { redirect_to action: new }
        #format.json { render json: { location: "/posts/63"}  }
      else
        #format.html { render :new }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:id, :user_id, :title, :post, :tags, :created_at, :updated_at, :group_id, :all_tags)#.merge(user_id: current_user.id)
    end
end
