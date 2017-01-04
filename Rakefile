require "bundler/gem_tasks"
task :default => :spec

IMAGE_NAME = 'compressionbinaries:v1'

require 'pry'
desc 'Build & run Docker container to build 32bit build env'
task :run_docker do
  sh "docker build -t #{IMAGE_NAME} . "
  sh "docker run -it -v #{Dir.pwd}:/build #{IMAGE_NAME} bash"
end
