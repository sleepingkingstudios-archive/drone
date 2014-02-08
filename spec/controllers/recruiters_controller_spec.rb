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

  describe '#create' do
    context 'with an invalid recruiter' do
      let(:params) { { :recruiter => {} } }

      def perform_action
        post :create, params
      end # method perform_action

      it 'responds with 200 ok and renders the new template' do
        perform_action
        expect(response.status).to be == 200
        expect(response).to render_template 'new'
      end # it

      it 'does not create a new recruiter' do
        expect { perform_action }.not_to change(Recruiter, :count)
      end # it
    end # context

    context 'with a valid recruiter' do
      let(:params)    { { :recruiter => FactoryGirl.attributes_for(:recruiter) } }
      let(:recruiter) { Recruiter.last }

      def perform_action
        post :create, params
      end # method perform_action

      it 'redirects to show' do
        perform_action
        expect(response.status).to be == 302
        expect(response).to redirect_to recruiter_path(recruiter)
      end # it

      it 'creates a new recruiter' do
        expect { perform_action }.to change(Recruiter, :count).to(1)
      end # it
    end # context
  end # describe
end # describe