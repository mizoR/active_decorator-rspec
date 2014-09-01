require "active_support"
require "active_decorator"
require "active_decorator/rspec"
require "rspec/its"

require File.join(File.dirname(__FILE__), "dummy_app.rb")

RSpec.configure do |config|
  config.before :all do
    CreateAuthors.up if !ActiveRecord::Base.connection.table_exists?('authors')
  end

  config.after :each do
    Author.delete_all
  end
end
