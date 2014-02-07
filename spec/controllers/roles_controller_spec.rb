# spec/controllers/roles_controller_spec.rb

require 'spec_helper'

RSpec.describe RolesController do
  describe '#index' do
    it 'responds with 200 ok and renders the show template' do
      get :index
      expect(response.status).to be == 200
      expect(response).to render_template 'index'
    end # it
  end # describe
end # describe
