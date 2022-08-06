class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def ensure_correct_user
    if Current.user.id != params[:id].to_i
      redirect_to root_path, alert: "Unauthorized access"
    end
  end

  def require_user_logged_in
    if Current.user.nil?
      redirect_to sign_in_path, notice: "You must be signed in."
    end
  end

  def forbid_user_logged_in
    if Current.user
      redirect_to lessons_url, notice: "You are already registered and logged in."
    end
  end

  def forbid_student_user
    if Current.user.user_type == "student"
      redirect_to lessons_path, alert: "You must be a teacher to access this page."
    end
  end
end
