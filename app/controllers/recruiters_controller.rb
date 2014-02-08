# app/controllers/recruiters_controller.rb

class RecruitersController < ApplicationController
  before_action :load_resources, :only => %i(index)

  # GET /recruiters
  def index; end

  private

  def load_resources
    @recruiters = Recruiter.all
  end # method load_resources
end # class
