# app/controllers/roles_controller.rb

class RolesController < ApplicationController
  before_action :build_resource, :only => %i(new create)
  before_action :load_resource,  :only => %i(show edit update destroy)
  before_action :load_resources, :only => %i(index)

  # POST /roles
  def create
    if @role.save
      redirect_to @role
    else
      render :new
    end # if-else
  end # method create

  # DELETE /roles/:id
  def destroy
    @role.destroy

    redirect_to roles_path
  end # method destroy

  # GET /roles/:id/edit
  def edit; end

  # GET /roles
  def index; end

  # GET /roles/new
  def new; end

  # GET /roles/:id
  def show; end

  # PATCH /roles/:id
  def update
    if @role.update_attributes role_params
      redirect_to @role
    else
      render :edit
    end # if-else
  end # action update

  private

  def build_resource
    @role = Role.new role_params
  end # method build_resource

  def load_resource
    @role = Role.find params[:id]
  end # method load_resource

  def load_resources
    sort_field     = params.fetch(:sort_field, 'date_submitted')
    sort_direction = params.fetch(:sort_direction, :asc)

    @roles = Role.order_by(sort_field => sort_direction)
  end # method load_resources

  def process_date! hsh
    if hsh.has_key? 'date_submitted(1i)'
      hsh[:date_submitted] = Date.new(*[*1..3].map { |index|
        hsh.delete("date_submitted(#{index}i)").to_i
      }) # end date
    end # if
    hsh
  end # process_date!

  def role_params
    hsh = params.fetch(:role, {}).permit(:company, :title, :date_submitted, :url, :notes)
    process_date!(hsh)
  end # method role_params
end # class
