# app/controllers/recruiters_controller.rb

class RecruitersController < ApplicationController
  before_action :build_resource, :only => %i(new)
  before_action :load_resources, :only => %i(index)

  # GET /recruiters
  def index; end

  # GET /recruiters/new
  def new; end

  private

  def build_resource
    @recruiter = Recruiter.new recruiter_params
  end # method build_resource

  def load_resources
    @recruiters = Recruiter.all
  end # method load_resources

  def recruiter_params
    params.fetch(:recruiter, {}).permit(:name, :agency, :email, :phone_number)
  end # method recruiter_params
end # class
