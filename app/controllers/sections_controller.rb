class SectionsController < ApplicationController
  before_action :forbid_student_user

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @section = @lesson.sections.new
  end
  
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @section = @lesson.sections.new(section_params)

    if @section.save
      redirect_to edit_lesson_section_path(@lesson, @section), notice: "Created new section"
    else
      flash[:alert] = @section.errors.full_messages.to_sentence
      redirect_to new_lesson_section_path(@lesson)
    end
  end

  def edit
    @lesson = Lesson.find(params[:lesson_id])
        
    if params[:id]
      @section = Section.find(params[:id])
    else
      @section = @lesson.sections.new(section_params)
    end
  end

  def update
    @lesson = Lesson.find(params[:lesson_id])
    @section = Section.find(params[:id])

    if @section.update(section_params)
      redirect_to edit_lesson_path(@lesson)
    else
      flash[:alert] = @section.errors.full_messages.to_sentence
      redirect_to edit_lesson_section_path(@lesson)
    end
  end

  def destroy
    @lesson = Lesson.find(params[:lesson_id])
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to edit_lesson_path(@lesson), alert: "Section deleted"
  end

  private

  def section_params
    params.require(:section).permit(:header, :content)
  end
end
