require 'bundler'
Bundler.setup

require 'opal/rake_task'

Opal::RakeTask.new do |t|
  t.name = 'vienna'
  t.dependencies = %w(opal-spec)
end

desc "Run phantom tests"
task :test => [:opal] do
  src = %w(build/opal.js build/opal-spec.js build/vienna.js build/specs.js)
  out = 'build/phantom_runner.js'
  File.open(out, 'w+') do |o|
    src.each { |s| o.write File.read(s) }
  end

  sh "phantomjs build/phantom_runner.js"
end

task :default => :test