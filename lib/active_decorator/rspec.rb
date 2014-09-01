require "active_decorator"
require "action_controller"
require "action_controller/test_case"
require "active_decorator/rspec/version"

module ActiveDecorator
  module RSpec
    def self.enable(example=nil)
      controller = Class.new(ActionController::Base).new
      controller.request = ActionController::TestRequest.new
      ActiveDecorator::ViewContext.current = controller.view_context

      example.extend self

      self
    end

    def decorate(obj)
      ActiveDecorator::Decorator.instance.decorate(obj)
      obj
    end
  end
end

RSpec.configure do |config|
  config.before :each, type: :decorator do
    ActiveDecorator::RSpec.enable(self)
  end
end
