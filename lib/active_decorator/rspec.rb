require "active_decorator"
require "action_controller"
require "action_controller/test_case"
require "active_decorator/rspec/version"

module ActiveDecorator
  module RSpec
    module HelperMethods
      def decorate(obj)
        ActiveDecorator::Decorator.instance.decorate(obj)
        obj
      end
    end

    def self.included(config)
      config.before :each do
        ActiveDecorator::ViewContext.current = begin
            controller = Class.new(ActionController::Base).new
            controller.request = ActionController::TestRequest.new
            view_context = controller.view_context
            view_context
          end 
      end

      ::RSpec::Core::ExampleGroup.include(HelperMethods)
    end
  end
end
