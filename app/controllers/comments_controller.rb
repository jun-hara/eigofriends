class CommentsController < ApplicationController
  before_action :require_user_logged_in, except: [:show]

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @comment = @lesson.comments.new(comment_params)    
    @comment.user_id = Current.user.id

    if @comment.save
      redirect_to lesson_path(@lesson), notice: "Comment posted"
    else
      redirect_to lesson_path(@lesson), alert: "Create comment failed"
    end
  end

  def edit
    @lesson = Lesson.find(params[:lesson_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:lesson_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to lesson_path(@lesson), notice: "Comment updated"
    else
      redirect_to lesson_path(@lesson), alert: "Update comment failed"
    end
  end

  def reply
    @lesson = Lesson.find(params[:lesson_id])
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end

end