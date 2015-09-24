require "active_record"
require 'action_controller/railtie'
require 'action_view/railtie'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

module DummyApp
  class Application < Rails::Application
    config.secret_token = 'b704c82f069d36a40b3ea167a45a16a0'
    config.session_store :cookie_store, :key => '_dummy_app_session'
    config.active_support.deprecation = :log
    config.eager_load = false
    config.root = File.join(File.dirname(__FILE__), 'dummy_app')
  end
end
DummyApp::Application.initialize!

DummyApp::Application.routes.draw do
  resources :authors, only: [:index, :show, :update]
end

module ApplicationHelper
end

module AuthorDecorator
  def reverse_name
    name.to_s.reverse
  end

  def link
    link_to name, self
  end

  def form
    form_for(self) {|f| f.text_field :name }
  end

  def url
    author_url(self)
  end

  def link_if_admin
    link if admin?
  end
end

class Author < ActiveRecord::Base
end

class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table(:authors) {|t| t.string :name}
  end
end
