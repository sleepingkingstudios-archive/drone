# app/controllers/roles_controller.rb

class RolesController < ApplicationController
  before_action :load_resources, :only => %i(index)

  # GET /roles
  def index
    
  end # action index

  private

  def load_resources
    @roles = Role.all
  end # method load_resources
end # class
