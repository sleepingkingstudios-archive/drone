# spec/models/recruiter_spec.rb

require 'spec_helper'

RSpec.describe Recruiter do
  let(:attributes) { FactoryGirl.attributes_for :recruiter }
  let(:instance)   { described_class.new attributes }

  describe '#agency' do
    it { expect(instance).to have_property(:agency) }
  end # describe

  describe '#email' do
    it { expect(instance).to have_property(:email) }
  end # describe

  describe '#name' do
    it { expect(instance).to have_property(:name) }
  end # describe

  describe '#phone_number' do
    it { expect(instance).to have_property(:phone_number) }
  end # describe

  describe '#roles' do
    it { expect(instance).to respond_to(:roles).with(0).arguments }
    it { expect(instance.roles).to be == [] }

    context 'with created roles' do
      before(:each) { instance.save }

      let(:roles) { [*0..2].map { FactoryGirl.create :role, :recruiter => instance } }

      it 'returns the roles' do
        expect(instance.roles).to be == roles
      end # it
    end # context
  end # describe

  describe 'validation' do
    it { expect(instance).to be_valid }

    describe 'name must be present' do
      let(:attributes) { super().merge :name => nil }

      it { expect(instance).to have_errors.on(:name).with_message('can\'t be blank') }
    end # describe
  end # describe
end # describe
