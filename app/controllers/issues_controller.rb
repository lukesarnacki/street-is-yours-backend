class IssuesController < ApplicationController
  before_action :authenticate_user

  def index
    @issues = Issue.all.where.not(latitude: nil, longitude: nil)
  end
end
