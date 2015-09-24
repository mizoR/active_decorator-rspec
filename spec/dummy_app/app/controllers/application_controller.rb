class ApplicationController < ActionController::Base
  helper_method :admin?

  def admin?
    true
  end
end
