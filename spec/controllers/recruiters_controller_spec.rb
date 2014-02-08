# spec/controllers/recruiters_controller_spec.rb

require 'spec_helper'

RSpec.describe RecruitersController do
  describe '#index' do
    it 'responds with 200 ok and renders the index template' do
      get :index
      expect(response.status).to be == 200
      expect(response).to render_template 'index'
    end # it
  end # describe

  describe '#new' do
    it 'responds with 200 ok and renders the new template' do
      get :new
      expect(response.status).to be == 200
      expect(response).to render_template 'new'
    end # it
  end # describe
end # describe