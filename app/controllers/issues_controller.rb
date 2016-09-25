class IssuesController < ApplicationController
  before_action :authenticate_user

  def index
    @issues = Issue.all.where.not(latitude: nil, longitude: nil).order(created_at: :desc)
    @recent_issue = @issues.last
  end

  def update
    @issue = Issue.find(params[:id])
    @issue.update(issue_params)
    redirect_to issues_path
  end

  private

  def issue_params
    params.require(:issue).permit(:state).tap do |whitelisted|
      whitelisted[:state] = params[:issue][:state].to_i
    end
  end
end
