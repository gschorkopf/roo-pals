class IssuesController < ApplicationController
  def create
    issue = Issue.new(issue_params)
    issue.upload
    redirect_to root_path
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :details, :label).merge(user: current_user.decorate)
  end
end
