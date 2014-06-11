class IssuesController < ApplicationController
  def create
    issue = Issue.new(issue_params)
    issue.upload

    if issue.success?
      flash[:notice] = "Thanks for submitting feedback!"
    else
      flash[:error] = "Unable to proccess feedback at this time."
    end

    redirect_to root_path
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :details, :label).merge(user: current_user.decorate)
  end
end
