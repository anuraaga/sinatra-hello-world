# Run only if not using bundler, or otherwise in the subprocess running the app, which includes bundler's RUBYOPT
if !ENV['_'].include?('bundle') || ENV['RUBYOPT'].include?('-rbundler/setup')
  module Sinatra
    class Base
      def self.singleton_method_added(name)
        if name == :register
          require 'opentelemetry/sdk'
          require 'opentelemetry/exporter/otlp'
          require 'opentelemetry/instrumentation/all'
          OpenTelemetry::SDK.configure do |c|
            c.use_all() # enables all instrumentation!
          end
        end
      end
    end
  end

  require 'bundler'
  require 'yaml'

  current_dir = File.expand_path(File.dirname(__FILE__))

  gem_paths = YAML.load(File.read("#{current_dir}/manifest.yml")).map { |path| "#{current_dir}/#{path}" }

  $LOAD_PATH.append(*gem_paths)
end
