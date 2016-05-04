require "rspec/core"
require "active_decorator"
require "action_controller"
require "action_controller/test_case"
require "active_decorator/rspec/version"

module ActiveDecorator
  module RSpec
    def self.enable(example)
      example.extend self

      base_class = begin
                     ApplicationController
                   rescue NameError
                     ActionController::Base
                   end
      controller = Class.new(base_class).new
      controller.request = if ActionController::TestRequest.respond_to?(:create)
                             ActionController::TestRequest.create
                           else
                             ActionController::TestRequest.new
                           end
      if ActiveDecorator::ViewContext.respond_to?(:current=)
        ActiveDecorator::ViewContext.current = controller.view_context
      else
        ActiveDecorator::ViewContext.push controller.view_context
      end

      self
    end

    def decorate(obj)
      ActiveDecorator::Decorator.instance.decorate(obj)
      obj
    end
  end
end

RSpec.configure do |config|
  dir_parts = %w<spec decorators>
  escaped_path = Regexp.compile(dir_parts.join('[\\\/]') + '[\\\/]')

  config.define_derived_metadata(file_path: escaped_path) do |metadata|
    metadata[:type] ||= :decorator
  end

  config.before :each, type: :decorator do
    ActiveDecorator::RSpec.enable(self)
  end
end
