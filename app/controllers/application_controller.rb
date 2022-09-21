class ApplicationController < ActionController::Base
  include Authentication
  include Pagy::Backend
end
