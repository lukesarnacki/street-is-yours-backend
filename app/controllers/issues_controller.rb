class IssuesController < ApplicationController
  before_action :authenticate_user
  
  def index
    @issues = Issue.all
  end
end
