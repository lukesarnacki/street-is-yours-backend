class Api::IssuesController < Api::BaseController

  def create
    issue = Issue.create!(issue_params)

    render json: issue
  end

  def index
    render json: Issue.all
  end

  def issue_params
    params.require(:issue).permit(:category, :description, :image, :latitude, :longitude)
  end
end
