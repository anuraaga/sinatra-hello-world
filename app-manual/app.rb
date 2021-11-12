# Comment out this line and instrumentation fails due to ordering constraint
require 'sinatra'

require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'opentelemetry/instrumentation/all'
OpenTelemetry::SDK.configure do |c|
  c.use_all() # enables all instrumentation!
end

require 'sinatra'

get '/' do
  'Hello world!'
end

