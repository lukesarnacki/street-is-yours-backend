class Api::IssuesController < Api::BaseController

  def create
    issue = Issue.create!(issue_params)

    render json: issue
  end

  def index
    issues = if params[:latitude].presence && params[:longitude].presence
               Issue.near([params[:latitude], params[:longitude]], 0.2, units: :km)
             else
               Issue.all
             end
    issues = issues.limit(params[:limit]) if params[:limit].present?

    render json: issues
  end

  def issue_params
    params.require(:issue).permit(:category, :description, :image, :latitude, :longitude)
  end
end
