# spec/models/role_spec.rb

require 'spec_helper'

RSpec.describe Role do
  let(:attributes) { FactoryGirl.attributes_for :role }
  let(:instance)   { described_class.new attributes }

  describe '#company' do
    it { expect(instance).to have_property(:company) }
  end # describe

  describe '#date_submitted' do
    it { expect(instance).to have_property(:date_submitted) }
  end # describe

  describe '#notes' do
    it { expect(instance).to have_property(:notes) }
  end # describe

  describe '#title' do
    it { expect(instance).to have_property(:title) }
  end # describe

  describe '#url' do
    it { expect(instance).to have_property(:url) }
  end # describe

  describe '#recruiter' do
    it { expect(instance).to respond_to(:recruiter) }
    it { expect(instance.recruiter).to be nil }

    context 'with a recruiter' do
      let(:attributes) { super().merge :recruiter => recruiter }
      let(:recruiter)  { FactoryGirl.create :recruiter }

      it 'returns the recruiter' do
        expect(instance.recruiter).to be == recruiter
      end # it
    end # context
  end # describe

  describe 'validation' do
    it { expect(instance).to be_valid }

    describe 'company must be present' do
      let(:attributes) { super().merge :company => nil }

      it { expect(instance).to have_errors.on(:company).with_message('can\'t be blank') }
    end # describe

    describe 'title must be present' do
      let(:attributes) { super().merge :title => nil }

      it { expect(instance).to have_errors.on(:title).with_message('can\'t be blank') }
    end # describe
  end # describe
end # describe
