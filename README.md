```
cd autoinstrumentation
bundle config set --local path 'vendor/bundle'
bundle install
bundle exec ruby bundle_manifest.rb

cd ../app
bundle config set --local path 'vendor/bundle'
bundle install

# no instrumentation
bundle exec ruby app.rb

# auto instrumentation
RUBYLIB=../autoinstrumentation RUBYOPT="-ropentelemetry-instrument"  bundle exec ruby app.rb

cd ../app-manual
bundle config set --local path 'vendor/bundle'
bundle install

# manual instrumentation
bundle exec ruby app.rb
