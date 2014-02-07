# spec/controllers/roles_controller_spec.rb

require 'spec_helper'

RSpec.describe RolesController do
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
    context 'with an invalid role' do
      let(:params) { { :role => {} } }

      def perform_action
        post :create, params
      end # method perform_action

      it 'responds with 200 ok and renders the new template' do
        perform_action
        expect(response.status).to be == 200
        expect(response).to render_template 'new'
      end # it

      it 'does not create a new role' do
        expect { perform_action }.not_to change(Role, :count)
      end # it
    end # context

    context 'with a valid role' do
      let(:params) { { :role => FactoryGirl.attributes_for(:role) } }
      let(:role)   { Role.last }

      def perform_action
        post :create, params
      end # method perform_action

      it 'redirects to show' do
        perform_action
        expect(response.status).to be == 302
        expect(response).to redirect_to role_path(role)
      end # it

      it 'creates a new role' do
        expect { perform_action }.to change(Role, :count).to(1)
      end # it
    end # context
  end # describe

  describe '#show' do
    let(:params) { { :id => role.id } }
    let!(:role) { FactoryGirl.create :role }

    it 'responds with 200 ok and renders the show template' do
      get :show, params
      expect(response.status).to be == 200
      expect(response).to render_template 'show'
    end # it
  end # describe

  describe '#edit' do
    let(:params) { { :id => role.id } }
    let!(:role) { FactoryGirl.create :role }

    it 'responds with 200 ok and renders the edit template' do
      get :edit, params
      expect(response.status).to be == 200
      expect(response).to render_template 'edit'
    end # it
  end # describe

  describe '#update' do
    let(:params) { { :id => role.id } }
    let!(:role) { FactoryGirl.create :role }

    context 'with invalid attributes' do
      let(:attributes) { { :title => nil } }
      let(:params) { super().merge :role => attributes }

      def perform_action
        patch :update, params
      end # method perform_action

      it 'responds with 200 ok and renders the edit template' do
        perform_action
        expect(response.status).to be == 200
        expect(response).to render_template 'edit'
      end # it

      it 'does not update the persisted role' do
        expect {
          perform_action
          role.reload
        }.not_to change(role, :title)
      end # it
    end # context

    context 'with valid attributes' do
      let(:attributes) { { :title => 'New Title' } }
      let(:params) { super().merge :role => attributes }

      def perform_action
        patch :update, params
      end # method perform_action

      it 'redirects to show' do
        perform_action
        expect(response.status).to be == 302
        expect(response).to redirect_to role_path(role)
      end # it

      it 'updates the persisted role' do
        expect {
          perform_action
          role.reload
        }.to change(role, :title).to(attributes[:title])
      end # it
    end # context
  end # describe

  describe '#destroy' do
    let(:params) { { :id => role.id } }
    let!(:role) { FactoryGirl.create :role }

    def perform_action
      delete :destroy, params
    end # method perform_action

    it 'redirects to index' do
      perform_action
      expect(response.status).to be == 302
      expect(response).to redirect_to roles_path
    end # it

    it 'destroys the role' do
      expect { perform_action }.to change(Role, :count).to(0)
    end # it
  end # describe
end # describe
