# spec/routing/roles_spec.rb

RSpec.describe 'routes for Roles' do
  include Drone::SharedExamples::RoutesToResource

  expect_behavior 'routes to resources', 'roles' do
    let(:controller_path) { 'roles' }
  end # shared behavior
end # describe
