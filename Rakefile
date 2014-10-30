#!/usr/bin/env rake
require 'rubygems'
require 'bundler'
require 'rspec/core/rake_task'

Bundler.setup :default, :test, :development, :spec

RSpec::Core::RakeTask.new(:spec) do |spec|
  ENV["RACK_ENV"] = "spec"
  spec.pattern = 'spec/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:test) do |spec|
  ENV["RACK_ENV"] = "test"
  spec.pattern = 'spec/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :rails_env do
end

task :environment do
end

task :misc do 
  Dir["misc/**/*.rb"].each{|f| require f}
end

task default:  :test

require File.expand_path('../environment', __FILE__)
module Rails
  def self.application
    Struct.new(:config, :paths) do
      def load_seed
        require File.expand_path('../application', __FILE__)
        require File.expand_path('../db/seeds', __FILE__)
      end
    end.new(config, paths)
  end

  def self.config
    require 'erb'
    db_config = YAML.load(ERB.new(File.read("config/database.yml")).result)
    Struct.new(:database_configuration).new(db_config)
  end

  def self.paths
    { 'db/migrate' => ["#{root}/db/migrate"] }
  end

  def self.env
    env = ENV['RACK_ENV'] || "development"
    ActiveSupport::StringInquirer.new(env)
  end

  def self.root
    File.dirname(__FILE__)
  end
end

namespace :g do
  desc "Generate migration. Specify name in the NAME variable"
  task :migration => :environment do
    name = ENV['NAME'] || raise("Specify name: rake g:migration NAME=create_users")
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")

    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split("_").map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<-EOF
        class #{migration_class} < ActiveRecord::Migration
          def self.up
          end

          def self.down
          end
        end
      EOF
    end

    puts "DONE"
    puts path
  end
end

Rake.load_rakefile "active_record/railties/databases.rake"