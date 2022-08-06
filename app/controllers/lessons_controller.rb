class LessonsController < ApplicationController
  before_action :forbid_student_user, except: [:index, :show]

  def index
    @lessons = Lesson.all
    
    if Current.user.nil?
      @user_is_teacher = false
    elsif Current.user.teacher?
      @user_is_teacher = true
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @comments = Comment.where(lesson_id: @lesson.id, parent_id: nil)
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      overview_section = @lesson.sections.new(header: "Overview")
      vocab_section = @lesson.sections.new(header: "Vocabulary")

      overview_section.save!
      vocab_section.save!
      redirect_to edit_lesson_path(@lesson)
    else
      flash[:alert] = @lesson.errors.full_messages.to_sentence
      redirect_to new_lesson_path(@lesson)
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update(lesson_params)
      redirect_to edit_lesson_path(@lesson)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to lessons_path, alert: "Lesson deleted"
  end

  private
  
  def lesson_params
    params.require(:lesson).permit( :title, :season, :status )
  end
end
