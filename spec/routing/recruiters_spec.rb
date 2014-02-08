# spec/routing/roles_spec.rb

RSpec.describe 'routes for Recruiters' do
  include Drone::SharedExamples::RoutesToResource

  expect_behavior 'routes to resources', 'recruiters'
end # describe
