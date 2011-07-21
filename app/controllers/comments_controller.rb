class CommentsController < ApplicationController


  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { redirect_to post_path(@post) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :ok }
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully created.' }
        format.json { render json: post_path(@post), status: :created, location: @comment }
      else
        format.html { redirect_to post_path(@post) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

=begin
  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end
=end

  # GET /comments
  # GET /comments.json
=begin
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end
=end
=begin
  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end
=end

end
