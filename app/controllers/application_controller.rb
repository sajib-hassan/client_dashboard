class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "username", password: "secret"
end
