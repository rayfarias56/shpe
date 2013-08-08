class ResumeViewsController < ApplicationController
  before_filter :company_user

  def index
    if params[:major] && params[:major].present?
      @users = User.where(company: false, major: params[:major])
    else
      @users = User.find_all_by_company(false)
    end
  end
end
