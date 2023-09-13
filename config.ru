require_relative 'time_app'
require 'rack'
use Rack::ContentType, "text/plain"
use Rack::ContentLength

ROUTES = {
  '/time' => TimeApp.new
}

run Rack::URLMap.new(ROUTES)
