# app/controllers/recruiters_controller.rb

class RecruitersController < ApplicationController
  before_action :build_resource, :only => %i(new create)
  before_action :load_resource,  :only => %i(show edit update destroy)
  before_action :load_resources, :only => %i(index)

  # POST /recruiters
  def create
    if @recruiter.save
      redirect_to @recruiter
    else
      render :new
    end # if-else
  end # action create

  # DELETE /recruiters/:id
  def destroy
    @recruiter.destroy
    redirect_to recruiters_path
  end # action destroy

  # GET /recruiters/:id/edit
  def edit; end

  # GET /recruiters
  def index; end

  # GET /recruiters/new
  def new; end

  # GET /recruiters/:id
  def show; end

  # PATCH /recruiters/:id
  def update
    if @recruiter.update_attributes recruiter_params
      redirect_to @recruiter
    else
      render :edit
    end # if-else
  end # action patch

  private

  def build_resource
    @recruiter = Recruiter.new recruiter_params
  end # method build_resource

  def load_resource
    @recruiter = Recruiter.find(params[:id])
  end # method load_resource

  def load_resources
    @recruiters = Recruiter.all
  end # method load_resources

  def recruiter_params
    params.fetch(:recruiter, {}).permit(:name, :agency, :email, :phone_number)
  end # method recruiter_params
end # class
