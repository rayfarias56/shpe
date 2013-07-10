class ResumeViewsController < ApplicationController
  before_filter :company_user
  def index
    @users = User.find_all_by_company(false)
  end
end
