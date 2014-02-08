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

  describe '#show' do
    let(:params)     { { :id => recruiter.id } }
    let!(:recruiter) { FactoryGirl.create :recruiter }

    it 'responds with 200 ok and renders the show template' do
      get :show, params
      expect(response.status).to be == 200
      expect(response).to render_template 'show'
    end # it
  end # describe

  describe '#edit' do
    let(:params)     { { :id => recruiter.id } }
    let!(:recruiter) { FactoryGirl.create :recruiter }

    it 'responds with 200 ok and renders the edit template' do
      get :edit, params
      expect(response.status).to be == 200
      expect(response).to render_template 'edit'
    end # it
  end # describe

  describe '#update' do
    let(:params) { { :id => recruiter.id } }
    let!(:recruiter) { FactoryGirl.create :recruiter }

    context 'with invalid attributes' do
      let(:attributes) { { :name => nil } }
      let(:params) { super().merge :recruiter => attributes }

      def perform_action
        patch :update, params
      end # method perform_action

      it 'responds with 200 ok and renders the edit template' do
        perform_action
        expect(response.status).to be == 200
        expect(response).to render_template 'edit'
      end # it

      it 'does not update the persisted recruiter' do
        expect {
          perform_action
          recruiter.reload
        }.not_to change(recruiter, :name)
      end # it
    end # context

    context 'with valid attributes' do
      let(:attributes) { { :name => 'Jane Doe' } }
      let(:params) { super().merge :recruiter => attributes }

      def perform_action
        patch :update, params
      end # method perform_action

      it 'redirects to show' do
        perform_action
        expect(response.status).to be == 302
        expect(response).to redirect_to recruiter_path(recruiter)
      end # it

      it 'updates the persisted recruiter' do
        expect {
          perform_action
          recruiter.reload
        }.to change(recruiter, :name).to(attributes[:name])
      end # it
    end # context
  end # describe
end # describe
